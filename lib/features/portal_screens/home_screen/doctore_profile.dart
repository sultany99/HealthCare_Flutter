import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hc_2/features/portal_screens/appoinment_screen/create_appointment_screen.dart';
import 'package:hc_2/features/portal_screens/home_screen/department_model.dart';
import 'package:hc_2/features/portal_screens/home_screen/doctor_model.dart';
import 'package:hc_2/features/portal_screens/home_screen/doctors.dart';
import 'package:hc_2/features/portal_screens/home_screen/home_screen_controller.dart';

class DoctorProfile extends StatefulWidget {
  DoctorModel doctor;

  DoctorProfile({super.key, required this.doctor});

  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    DoctorModel doctor = widget.doctor;
    HomeScreenController hmc = HomeScreenController();
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(bottom: 30, top: 10, left: 10, right: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton.outlined(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "الطبيب:" " ${doctor.name}",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Cairo Regular"),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.memory(
                    width: 250,
                    height: 250,
                    widget.doctor.image,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "القسم:" " ${doctor.department}",
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Cairo Regular"),
                          textAlign: TextAlign.right,
                        ),
                        Text(
                          "الاختصاص:" " ${doctor.jobTitle}",
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Cairo Regular"),
                          textAlign: TextAlign.right,
                        ),
                        Text(
                          "الهاتف:" " ${doctor.phone}",
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Cairo Regular"),
                          textAlign: TextAlign.right,
                        ),
                        Text(
                          " ${doctor.email}" " :البريد الالكتروني",
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Cairo Regular"),
                          textAlign: TextAlign.right,
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CreateAppointmentScreen(doctorModel: doctor,);
                      }));
                    },
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                    child: const Text(
                      "طلب موعد",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
