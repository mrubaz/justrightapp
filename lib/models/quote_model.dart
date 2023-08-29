import 'dart:convert';

List<Quotes> quotesFromJson(String str) => List<Quotes>.from(json.decode(str).map((x) => Quotes.fromJson(x)));

String quotesToJson(List<Quotes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Quotes {
  Quotes({
    required this.q,
    required this.a,
    required this.c,
    required this.h,
  });

  String q;
  String a;
  String c;
  String h;

  factory Quotes.fromJson(Map<String, dynamic> json) => Quotes(
        q: json["q"],
        a: json["a"],
        c: json["c"],
        h: json["h"],
      );

  Map<String, dynamic> toJson() => {
        "q": q,
        "a": a,
        "c": c,
        "h": h,
      };
}
