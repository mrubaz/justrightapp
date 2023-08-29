// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// class EventModel {
//   final String title;
//   final String date;
//   final String desc;
//   final String? id;
//   EventModel({
//     required this.title,
//     required this.date,
//     required this.desc,
//     this.id,
//   });

//   EventModel copyWith({
//     String? title,
//     String? date,
//     String? desc,
//     String? id,
//   }) {
//     return EventModel(
//       title: title ?? this.title,
//       date: date ?? this.date,
//       desc: desc ?? this.desc,
//       id: id ?? this.id,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'title': title,
//       'date': date,
//       'desc': desc,
//       'id': id,
//     };
//   }

//   factory EventModel.fromMap(Map<String, dynamic> map) {
//     return EventModel(
//       title: map['title'] as String,
//       date: map['date'] as String,
//       desc: map['desc'] as String,
//       id: map['id'] != null ? map['id'] as String : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory EventModel.fromJson(String source) =>
//       EventModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'EventModel(title: $title, date: $date, desc: $desc, id: $id)';
//   }

//   @override
//   bool operator ==(covariant EventModel other) {
//     if (identical(this, other)) return true;

//     return other.title == title &&
//         other.date == date &&
//         other.desc == desc &&
//         other.id == id;
//   }

//   @override
//   int get hashCode {
//     return title.hashCode ^ date.hashCode ^ desc.hashCode ^ id.hashCode;
//   }
// }
