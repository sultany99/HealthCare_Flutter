import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hc_2/features/portal_screens/home_screen/department_model.dart';
import 'package:hc_2/features/portal_screens/home_screen/doctors.dart';
import 'package:hc_2/features/portal_screens/home_screen/home_screen_controller.dart';
import 'package:hc_2/features/materials/widgets.dart';

class DepartmentProfile extends StatefulWidget {
  DepartmentModel department;

  DepartmentProfile({super.key, required this.department});

  @override
  _DepartmentProfileState createState() => _DepartmentProfileState();
}

class _DepartmentProfileState extends State<DepartmentProfile> {
  @override
  Widget build(BuildContext context) {
    DepartmentModel department = widget.department;
    DoctorsScreen doctorsScreen = DoctorsScreen(
      true,
      departmentId: department.id,
    );
    HomeScreenController hmc = HomeScreenController();
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
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
                      "القسم:" " ${department.name}",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Cairo Regular"),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              doctorsScreen,
            ],
          ),
        ),
      ),
    );
  }
}
