import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hc_2/features/portal_screens/appoinment_screen/appointment_model.dart';
import 'package:hc_2/features/portal_screens/appoinment_screen/appointment_screen_controller.dart';
import 'package:intl/intl.dart' as intl;

class AppointmentReviewScreen extends StatefulWidget {
  AppointmentModel appointmentModel;

  AppointmentReviewScreen({super.key, required this.appointmentModel});

  @override
  _AppointmentReviewScreenState createState() =>
      _AppointmentReviewScreenState();
}

class _AppointmentReviewScreenState extends State<AppointmentReviewScreen> {
  @override
  Widget build(BuildContext context) {
    var dateFormatter = intl.DateFormat('yyyy-MM-dd – kk:mm');

    AppointmentModel appointment = widget.appointmentModel;
    AppointmentScreenController ac = AppointmentScreenController();
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton.outlined(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back)),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("الطبيب ",style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),),
                    Text(
                      appointment.doctorName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("القسم ",style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),),
                    Text(
                      appointment.department,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("التاريخ ",style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),),
                    Text(
                      dateFormatter.format(appointment.date),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("الوصف ",style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),),
                    Text(
                      appointment.description,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
