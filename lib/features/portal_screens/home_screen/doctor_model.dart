import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';

class DoctorModel {
  int id;
  String name;
  String department;
  Uint8List image;

  String phone;
  String email;
  String jobTitle;

  DoctorModel({
    required this.id,
    required this.name,
    required this.department,
    required this.phone,
    required this.jobTitle,
    required this.email,
    required this.image,
  });

  // Factory constructor to create a DepartmentModel from a map
  factory DoctorModel.fromMap(Map<String, dynamic> map) {
    print("asdreveervervrevrdsdsds  ${base64Decode(map['image'])}");

    DoctorModel ret = DoctorModel(
      id: map['id'],
      name: map['name'],
      jobTitle: map['job_title'],
      department: map['department'],
      image: base64Decode(map['image']),
      phone: map['mobile'],
      email: map['email'],
    );

    return ret;
  }
}
