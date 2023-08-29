import 'package:cloud_firestore/cloud_firestore.dart';

class WorkoutsModel {
  int? callories;
  int? exercisesNumber;
  String? image;
  String? id;
  int? durationMinutes;
  Timestamp? createdAt;
  String? title;

  WorkoutsModel({this.callories, this.exercisesNumber, this.image, this.id, this.durationMinutes, this.createdAt, this.title});

  WorkoutsModel.fromJson(Map<String, dynamic> json) {
    callories = json['callories'];
    exercisesNumber = json['exercises_number'];
    image = json['image'];
    id = json['id'];
    durationMinutes = json['duration_minutes'];
    createdAt = json['created_at'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['callories'] = callories;
    data['exercises_number'] = exercisesNumber;
    data['image'] = image;
    data['id'] = id;
    data['duration_minutes'] = durationMinutes;
    data['created_at'] = createdAt;
    data['title'] = title;
    return data;
  }
}
