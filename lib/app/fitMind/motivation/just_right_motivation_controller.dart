import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../models/quote_model.dart';

class MotivationController extends GetxController {
  @override
  void onInit() {
    getQuote();
    super.onInit();
  }

  late RxList<Quotes> qoutesList = RxList();

  getQuote() async {
    String baseUrl = 'https://zenquotes.io/api/quotes';
    http.Response response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    var data = jsonDecode(response.body);
    data.forEach((value) {
      qoutesList.add(Quotes.fromJson(value));
    });
    update();
  }
}
