import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../services/adminbasecontroller.dart';

import '../../../utils/constants.dart';
import '../../../utils/methods.dart';

class EditProfileController extends GetxController {
  RxBool isEditingText = false.obs;
  TextEditingController? editingController;
  Rx<String?> initialText = AdminBaseController.userData.value.userName.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? pickedImage;
  File? file;
  final storage = FirebaseStorage.instance;
  String? url;
  String? userName;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    userName = _auth.currentUser!.displayName;
    editingController = userName == null ? TextEditingController(text: initialText.value) : TextEditingController(text: userName);
    super.onInit();
  }

  editableMethod() {
    isEditingText.value
        ? (newValue) {
            initialText = newValue;
            isEditingText.value = false;
            update();
          }
        : (initialText) {
            initialText = initialText;
            isEditingText.value = true;
            update();
          };
    update();
  }

  //Profile Photo Functions
  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: AppColors.darkGreenColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Upload Your Profile Photo",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                      update();
                    },
                    style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColors.greenColor)),
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                      update();
                    },
                    style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColors.greenColor)),
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColors.greenColor)),
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final XFile? photo = await ImagePicker().pickImage(source: imageType);
      if (photo != null) {
        file = File(photo.path.toString());
        update();
        Get.back();
        update();
        return url;
      } else {
        return null;
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> updateUserinfo() async {
    AdminBaseController().showProgress();
    final userID = _auth.currentUser!.uid;
    final db = FirebaseFirestore.instance.collection('users').doc(userID);
    if (file != null) {
      //Edit UserProfile
      final Reference storageRef = storage.ref("Profiles/").child("profile${getRandomSCString(10)}");
      UploadTask uploadTask = storageRef.putFile(file!);
      await uploadTask.whenComplete(() async => {
            url = await storageRef.getDownloadURL(),
            update(),
          });
      var userOldDetail = AdminBaseController.userData.value;
      userOldDetail.urlImage = url;
      AdminBaseController().updateUser(userOldDetail);
      update();
      await db.update({
        "urlImage": "${AdminBaseController.userData.value.urlImage}"
      });
      update();
    }
    if (editingController?.text != null) {
      //Edit UserName
      var userOldDetail = AdminBaseController.userData.value;
      userOldDetail.userName = editingController?.text.trim() ?? '';
      AdminBaseController().updateUser(userOldDetail);
      update();
      await db.update({
        "userName": "${AdminBaseController.userData.value.userName}"
      });
      AdminBaseController().hideProgress();
    } else {
      showOkAlertDialog(context: Get.context!);
    }
  }
}
