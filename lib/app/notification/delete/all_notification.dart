// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// 
// import '../controller/allnotification/all_notification_controller.dart';
// import '../controller/allnotification/all_notification_model.dart';

// class AllNotification extends StatelessWidget {
//   final _controller = Get.put(AllNotificationController());
//   AllNotification({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(height: 30),
//         Obx(
//           () => Expanded(
//             child: ListView.builder(
//               itemCount: _controller.items.length,
//               shrinkWrap: true,
//               itemBuilder: ((context, index) {
//                 AllNotificationModel allnotificationDat =
//                     _controller.items[index];
//                 return Slidable(
//                   key: Key(index.toString()),
//                   endActionPane: ActionPane(
//                     extentRatio: 0.2,
//                     motion: const StretchMotion(),
//                     children: [
//                       SlidableAction(
//                         backgroundColor: AppColors.redButton,
//                         icon: Icons.delete,
//                         onPressed: (context) {
//                           deleteMsgDialog(context, index);
//                         },
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Column(
//                       children: [
//                         const Divider(
//                             color: AppColors.dotsColors, thickness: 2),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(children: [
//                                 Text(allnotificationDat.title,
//                                     style: StyleRefer.poppinsMedium
//                                         .copyWith(fontSize: 15)),
//                                 const Spacer(),
//                                 Text(allnotificationDat.date,
//                                     style: StyleRefer.poppinsMedium
//                                         .copyWith(fontSize: 16)),
//                               ]),
//                               const SizedBox(height: 8),
//                               Text(allnotificationDat.desc,
//                                   style: StyleRefer.poppinsMedium
//                                       .copyWith(fontSize: 16)),
//                             ],
//                           ),
//                         ),
//                         const Divider(
//                             color: AppColors.dotsColors, thickness: 2),
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// Future<dynamic> deleteMsgDialog(BuildContext context, int index) {
//   final controller = Get.put(AllNotificationController());
//   return showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       backgroundColor: AppColors.darkGreenColor,
//       content: Text(
//         AppStrings.popupmsg,
//         style: StyleRefer.poppinsMedium
//             .copyWith(fontSize: 16, overflow: TextOverflow.clip),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: Text(
//             AppStrings.cancel,
//             style: StyleRefer.poppinsMedium
//                 .copyWith(fontSize: 16, overflow: TextOverflow.clip),
//           ),
//         ),
//         TextButton(
//           onPressed: () => controller.deleteMessage(index),
//           child: Text(
//             AppStrings.delete,
//             style: StyleRefer.poppinsMedium
//                 .copyWith(fontSize: 16, overflow: TextOverflow.clip),
//           ),
//         ),
//       ],
//     ),
//   );
// }
