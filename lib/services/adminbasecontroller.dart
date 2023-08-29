import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/usermodel.dart';

class AdminBaseController extends GetxController {
  var userModel = UserData().obs;
  static bool isAlreadyShow = false;

  static Rx<UserData> get userData {
    return Get.put(AdminBaseController(), permanent: true).userModel;
  }

  void updateUser(UserData userModel) {
    var userController = Get.put(AdminBaseController(), permanent: true);
    userController.userModel.value = userModel;
    userController.update();
    update();
  }

  //******************
  void showProgress()
  //******************
  {
    if (isAlreadyShow) {
      return;
    }
    isAlreadyShow = true;
    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (context) {
          return const Padding(
            padding: EdgeInsets.all(20.0),
            child: AlertDialog(
                contentPadding: EdgeInsets.zero,
                titlePadding: EdgeInsets.symmetric(vertical: 15),
                insetPadding: EdgeInsets.zero,
                buttonPadding: EdgeInsets.zero,
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      NativeProgress(),
                      SizedBox(width: 20),
                      Text("Loading....")
                    ],
                  ),
                )),
          );
        });
  }

  //******************
  void hideProgress()
  //******************
  {
    try {
      if (isAlreadyShow) {
        isAlreadyShow = false;
        Navigator.pop(Get.context!);
      }
      //if (_dialogContext != null) Navigator.pop(_dialogContext!);
    } catch (E) {
      return log(E.toString());
    }
  }
}

class NativeProgress extends StatelessWidget {
  const NativeProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? const Center(
            child: SizedBox(
                height: 30, width: 30, child: CircularProgressIndicator()))
        : Center(
            child: Theme(
                data: ThemeData(
                    cupertinoOverrideTheme: const CupertinoThemeData(
                        brightness: Brightness.light,
                        primaryColor: Colors.white,
                        barBackgroundColor: Colors.white)),
                child: const CupertinoActivityIndicator()),
          );
  }
}
