import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hc_2/features/portal_screens/home_screen/department_model.dart';
import 'package:hc_2/features/portal_screens/home_screen/doctor_model.dart';
import 'package:hc_2/features/portal_screens/home_screen/doctors.dart';
import 'package:hc_2/features/portal_screens/home_screen/home_screen_controller.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    HomeScreenController hmc = HomeScreenController();
    return SafeArea(
      child: Center(
        child: Text("Profile"),
      ),
    );
  }
}
