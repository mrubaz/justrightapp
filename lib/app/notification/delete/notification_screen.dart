// import 'package:flutter/material.dart';
// 
// import 'all_notification.dart';
// import 'events_notification.dart';
// import 'new_notification.dart';

// class NotificationScreen extends StatelessWidget {
//   const NotificationScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.darkGreenColor,
//       body: DefaultTabController(
//         length: 3,
//         child: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 30),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     CustomWidget(title: AppStrings.notification),
//                     SizedBox(height: 30),
//                     TabbarWidget(
//                       firstTab: AppStrings.newNotify,
//                       secondTab: AppStrings.eventsNotify,
//                       thirdTab: AppStrings.allNotify,
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: TabBarView(
//                   children: [
//                     NewNotification(),
//                     EventsNotification(),
//                     AllNotification(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
