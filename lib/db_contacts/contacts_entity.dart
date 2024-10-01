import 'dart:typed_data';

import 'package:intl/intl.dart';

class ContactsEntity {
  int id;
  DateTime createdTime;
  int type;
  String name;
  int gender;
  Uint8List image;
  DateTime birth;

  ContactsEntity({
    required this.id,
    required this.createdTime,
    required this.type,
    required this.name,
    required this.gender,
    required this.image,
    required this.birth,
  });

  factory ContactsEntity.fromJson(Map<String, dynamic> json) {
    return ContactsEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      type: json['type'],
      name: json['name'],
      gender: json['gender'],
      image: json['image'],
      birth: DateTime.parse(json['birth']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'type': type,
      'name': name,
      'gender': gender,
      'image': image,
      'birth': birth.toIso8601String(),
    };
  }

  String get birthStr {
    return DateFormat('MM/dd/yyyy').format(birth);
  }

}