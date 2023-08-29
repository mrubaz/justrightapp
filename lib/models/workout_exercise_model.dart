import 'package:cloud_firestore/cloud_firestore.dart';

class WorkoutExercisesModel {
  String? videoUrl;
  String? id;
  int? calories;
  String? title;
  Timestamp? createdAt;
  String? thumbnailurl;
  int? durationSec;

  WorkoutExercisesModel({this.videoUrl, this.id, this.calories, this.title, this.createdAt, this.thumbnailurl, this.durationSec});

  WorkoutExercisesModel.fromJson(Map<String, dynamic> json) {
    videoUrl = json['video_url'];
    id = json['id'];
    calories = json['calories'];
    title = json['title'];
    createdAt = json['created_at'];
    thumbnailurl = json['thumbnail_url'];
    durationSec = json['duration_sec'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['video_url'] = videoUrl;
    data['id'] = id;
    data['calories'] = calories;
    data['title'] = title;
    data['created_at'] = createdAt;
    data['thumbnail_url'] = thumbnailurl;
    data['duration_sec'] = durationSec;
    return data;
  }
}
