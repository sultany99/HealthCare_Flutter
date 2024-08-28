import 'package:intl/intl.dart';

class AppointmentModel {

  int id;
  DateTime date;
  String doctorName;
  String department;
  String description;

  AppointmentModel({
    required this.id,
    required this.date,
    required this.doctorName,
    required this.description,
    required this.department,
  });


  // Factory constructor to create a AppointmentModel from a map
  factory AppointmentModel.fromMap(Map<String, dynamic> map) {
    DateFormat dateFormat = DateFormat('dd-MM-yyyy HH:mm');
    print("dfsdfsdfsdfsdf $map");

    AppointmentModel ret = AppointmentModel(
      id: map['id'],
      date: dateFormat.parse(map['date']),
      doctorName: map['doctor'],
      description: map['summary'],
      department: map['department'],
    );
    print("dfsdfsdfsdfsdf");
    return ret;
  }

}