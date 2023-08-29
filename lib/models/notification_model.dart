// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NotificationModel {
  final String title;
  final String date;
  final String desc;
  final String? id;
  NotificationModel({
    required this.title,
    required this.date,
    required this.desc,
    this.id,
  });

  NotificationModel copyWith({
    String? title,
    String? date,
    String? desc,
  }) {
    return NotificationModel(
      title: title ?? this.title,
      date: date ?? this.date,
      desc: desc ?? this.desc,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'date': date,
      'desc': desc,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      title: map['title'] as String,
      date: map['date'] as String,
      desc: map['desc'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'NotificationModel(title: $title, date: $date, desc: $desc)';

  @override
  bool operator ==(covariant NotificationModel other) {
    if (identical(this, other)) return true;

    return other.title == title && other.date == date && other.desc == desc;
  }

  @override
  int get hashCode => title.hashCode ^ date.hashCode ^ desc.hashCode;
}
