import 'package:cloud_firestore/cloud_firestore.dart';

class SoundsDetailsModel {
  String? duration;
  String? categoryID;
  String? name;
  Timestamp? createdAt;
  String? audioUrl;
  String? id;

  SoundsDetailsModel({this.duration, this.categoryID, this.name, this.createdAt, this.audioUrl, this.id});

  SoundsDetailsModel.fromJson(Map<String, dynamic> json) {
    duration = json['duration'];
    categoryID = json['category_ID'];
    name = json['name'];
    createdAt = json['created_at'];
    audioUrl = json['audio_url'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['duration'] = duration;
    data['category_ID'] = categoryID;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['audio_url'] = audioUrl;
    data['id'] = id;
    return data;
  }
}
