import 'package:cloud_firestore/cloud_firestore.dart';

class ExerciseDetailsModel {
  int? duration;
  String? thumbnail;
  String? videoUrl;
  Timestamp? createdAt;
  String? id;
  String? title;
  String? exerciseTypeId;

  ExerciseDetailsModel({this.duration, this.thumbnail, this.videoUrl, this.createdAt, this.id, this.title, this.exerciseTypeId});

  ExerciseDetailsModel.fromJson(Map<String, dynamic> json) {
    duration = json['duration'];
    thumbnail = json['thumbnail'];
    videoUrl = json['video_url'];
    createdAt = json['created_at'];
    id = json['id'];
    title = json['title'];
    exerciseTypeId = json['exercise_type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['duration'] = duration;
    data['thumbnail'] = thumbnail;
    data['video_url'] = videoUrl;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['title'] = title;
    data['exercise_type_id'] = exerciseTypeId;
    return data;
  }
}
