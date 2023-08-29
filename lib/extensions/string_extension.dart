// import 'package:flutter/cupertino.dart';
// import 'package:intl/intl.dart';

// extension DateExtension on DateTime {
//   String formatDate(String format) {
//     var now = this;
//     var formatter = DateFormat(format);
//     String formattedDate = formatter.format(now);
//     return formattedDate;
//   }

//   bool isToday() {
//     var now = DateTime.now();
//     return (this.day == now.day &&
//         this.month == now.month &&
//         this.year == now.year);
//   }

//   bool isTomorrow() {
//     var now = DateTime.now();
//     print("************************************");

//     print(this.day);
//     print(now.day);
//     return (this.day == (now.day + 1) &&
//         this.month == now.month &&
//         this.year == now.year);
//   }

//   bool isSameDate(DateTime other) {
//     return this.year == other.year &&
//         this.month == other.month &&
//         this.day == other.day;
//   }
// }

// extension EmailValidator on String {
//   bool isValidEmail() {
//     return RegExp(
//             r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
//         .hasMatch(this);
//   }

//   String kcapitalizeFirstLetter() {
//     if ((length) == 0) return this;
//     if ((length) == 1) return this.toUpperCase();
//     return this[0].toUpperCase() + this.substring(1);
//   }

//   String kcapitalizeWord() {
//     if ((length) == 0) return this;
//     if ((length) == 1) return this.toUpperCase();
//     var dataSplit = this.split(" ");
//     print(dataSplit);
//     var data = "";
//     int index = 0;
//     for (var word in dataSplit) {
//       if (index == 0) {
//         data = word;
//       } else {
//         data = data + " " + word.kcapitalizeFirstLetter();
//       }
//       index++;
//     }
//     return data;
//   }

//   bool isNumber() {
//     try {
//       var num = int.parse(this);
//     } on Exception catch (e) {
//       // TODO
//       return false;
//     }
//     return true;
//   }

//   int toNumber() {
//     try {
//       var num = int.parse(this);
//       return num;
//     } on Exception catch (e) {
//       // TODO
//       return 0;
//     }
//   }
// }

// extension NumberParsing on int {
//   double wRes(BuildContext context) {
//     double originalWidth = 1920;
//     double value = this.toDouble();
//     double calculatedValue =
//         (value / originalWidth) * MediaQuery.of(context).size.width;
// /*    print(value.toString() +
//         " => " +
//         calculatedValue.toString() +
//         " => w " +
//         Get.size.width.toString());*/
//     return calculatedValue < 10 ? 10 : calculatedValue;
//   }

//   double hRes(BuildContext context) {
//     double originalHeight = 1080;
//     double value = this.toDouble();
//     double calculatedValue =
//         (value / originalHeight) * MediaQuery.of(context).size.height;
// /*    print(value.toString() +
//         " => " +
//         calculatedValue.toString() +
//         " => h " +
//         Get.size.height.toString());*/
//     return calculatedValue < 10 ? 10 : calculatedValue;
//   }
// }

// extension DoubleParsing on double {
//   double wRes(BuildContext context) {
//     double originalWidth = 1200;
//     double value = this;
//     double calculatedValue =
//         (value / originalWidth) * MediaQuery.of(context).size.width;
//     return calculatedValue < 10 ? 10 : calculatedValue;
//   }

//   double hRes(BuildContext context) {
//     double originalHeight = 1080;
//     double value = this.toDouble();
//     double calculatedValue =
//         (value / originalHeight) * MediaQuery.of(context).size.height;
// /*    print(value.toString() +
//         " => " +
//         calculatedValue.toString() +
//         " => h " +
//         Get.size.height.toString());*/
//     return calculatedValue < 10 ? 10 : calculatedValue;
//   }
// }

// String kformatDate(DateTime dateTime) {
//   String date = "";
//   date = dateTime.day <= 9
//       ? "0" + dateTime.day.toString()
//       : dateTime.day.toString();
//   date += "-";
//   date += dateTime.month <= 9
//       ? "0" + dateTime.month.toString()
//       : dateTime.month.toString();
//   date += "-";
//   date += dateTime.year <= 9
//       ? "0" + dateTime.year.toString()
//       : dateTime.year.toString();
//   return date;
// }

// extension ListExtension<T> on List<T> {
//   List<Widget> mapWithIndex(
//       dynamic Function(dynamic element, int index) elementCallBack) {
//     List<Widget> tempList = [];
//     for (int i = 0; i < length; i++) {
//       var widgets = elementCallBack.call(this[i], i);
//       tempList.add(widgets);
//     }
//     return tempList;
//   }

//   List<T> mapList(T Function(dynamic element) elementCallBack) {
//     List<T> outputList = [];
//     List<Map<String, dynamic>> list = this as List<Map<String, dynamic>>;
//     list.forEach((listElement) {
//       outputList.add(elementCallBack.call(listElement));
//     });
//     return outputList;
//   }
// }

// extension MapExtension<T, U> on Map<T, U> {
//   int getIndex(T value) {
//     int index = 0;
//     for (var item in this.keys.toList()) {
//       if (item.toString().toLowerCase().contains(value.toString()))
//         return index;
//       index++;
//     }
//     return index;
//   }

//   T? getkey(int selectedIndex) {
//     int index = 0;
//     for (var item in this.keys.toList()) {
//       if (index == selectedIndex) return item;
//       index++;
//     }
//     return null;
//   }

//   U? getValue(int selectedIndex) {
//     int index = 0;
//     for (var item in this.keys.toList()) {
//       if (index == selectedIndex) return this[item];
//       index++;
//     }
//     return null;
//   }
// }
