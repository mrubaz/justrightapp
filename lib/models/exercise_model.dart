import 'package:cloud_firestore/cloud_firestore.dart';

class ExerciseModel {
  int? type;
  String? name;
  Timestamp? createdAt;
  String? id;

  ExerciseModel({this.type, this.name, this.createdAt, this.id});

  ExerciseModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
