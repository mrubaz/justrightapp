import 'package:cloud_firestore/cloud_firestore.dart';

class JournalModel {
  Timestamp? createdAt;
  List<JournalsTasks>? journalsTasks;
  String? id;
  String? title;

  JournalModel({this.createdAt, this.journalsTasks, this.id, this.title});

  JournalModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    if (json['journalsTasks'] != null) {
      journalsTasks = <JournalsTasks>[];
      json['journalsTasks'].forEach((v) {
        journalsTasks!.add(JournalsTasks.fromJson(v));
      });
    }
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    if (journalsTasks != null) {
      data['journalsTasks'] = journalsTasks!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}

class JournalsTasks {
  String? task;
  bool? checkmark;
  int? taskid;

  JournalsTasks({this.task, this.checkmark, this.taskid});

  JournalsTasks.fromJson(Map<String, dynamic> json) {
    task = json['task'];
    checkmark = json['checkmark'];
    taskid = json['taskid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['task'] = task;
    data['checkmark'] = checkmark;
    data['taskid'] = taskid;
    return data;
  }
}
