import 'dart:ffi';

import 'package:flutter/foundation.dart';

class DepartmentModel {
  late int id;
  late String name;

  DepartmentModel({required this.id, required this.name});

  // Factory constructor to create a DepartmentModel from a map
  factory  DepartmentModel.fromMap(Map<dynamic, dynamic> map) {

    DepartmentModel ret = DepartmentModel(
      id: map['id'],
      name: map['name'],
    );
    if (kDebugMode) {
      print("asdreveervervrevr ${map['name']} ${ret.name}");
    }
    return ret;
  }
}
