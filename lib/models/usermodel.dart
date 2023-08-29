import 'dart:convert';

class UserData {
  String? uid;
  String? gender;
  String? userName;
  String? urlImage;
  int? age;
  int? weight;
  int? height;
  String? goal;
  String? activityLevel;
  UserData({
    this.uid,
    this.gender,
    this.userName,
    this.age,
    this.weight,
    this.height,
    this.goal,
    this.activityLevel,
    this.urlImage,
  });

  static UserData empty() => UserData(
        activityLevel: "",
        age: 0,
        gender: "",
        userName: "",
        urlImage: "",
        goal: "",
        height: 0,
        uid: "",
        weight: 0,
      );
  UserData copyWith({
    String? uid,
    String? gender,
    String? userName,
    String? urlImage,
    int? age,
    int? weight,
    int? height,
    String? goal,
    String? activityLevel,
  }) {
    return UserData(
      uid: uid ?? this.uid,
      gender: gender ?? this.gender,
      userName: userName ?? this.userName,
      urlImage: urlImage ?? this.urlImage,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      goal: goal ?? this.goal,
      activityLevel: activityLevel ?? this.activityLevel,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (uid != null) {
      result.addAll({'uid': uid});
    }
    if (gender != null) {
      result.addAll({'gender': gender});
    }
    if (userName != null) {
      result.addAll({'userName': userName});
    }
    if (urlImage != null) {
      result.addAll({'urlImage': urlImage});
    }
    if (age != null) {
      result.addAll({'age': age});
    }
    if (weight != null) {
      result.addAll({'weight': weight});
    }
    if (height != null) {
      result.addAll({'height': height});
    }
    if (goal != null) {
      result.addAll({'goal': goal});
    }
    if (activityLevel != null) {
      result.addAll({'activityLevel': activityLevel});
    }

    return result;
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      uid: map['uid'],
      gender: map['gender'],
      userName: map['userName'],
      urlImage: map['urlImage'],
      age: map['age']?.toInt(),
      weight: map['weight']?.toInt(),
      height: map['height']?.toInt(),
      goal: map['goal'],
      activityLevel: map['activityLevel'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserData(uid: $uid, gender: $gender, userName: $userName, urlImage: $urlImage, age: $age, weight: $weight, height: $height, goal: $goal, activityLevel: $activityLevel)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserData &&
        other.uid == uid &&
        other.gender == gender &&
        other.userName == userName &&
        other.urlImage == urlImage &&
        other.age == age &&
        other.weight == weight &&
        other.height == height &&
        other.goal == goal &&
        other.activityLevel == activityLevel;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        gender.hashCode ^
        urlImage.hashCode ^
        age.hashCode ^
        weight.hashCode ^
        height.hashCode ^
        goal.hashCode ^
        activityLevel.hashCode;
  }
}
