import 'package:cloud_firestore/cloud_firestore.dart';

class MeditationModel {
  int? sounds;
  String? name;
  Timestamp? createdAt;
  String? id;

  MeditationModel({this.sounds, this.name, this.createdAt, this.id});

  MeditationModel.fromJson(Map<String, dynamic> json) {
    sounds = json['sounds'];
    name = json['name'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sounds'] = sounds;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
