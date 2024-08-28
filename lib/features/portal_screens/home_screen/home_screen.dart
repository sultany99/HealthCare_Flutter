import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hc_2/features/portal_screens/home_screen/departments.dart';
import 'package:hc_2/features/portal_screens/home_screen/doctors.dart';
import 'package:hc_2/features/portal_screens/home_screen/home_screen_controller.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    DepartmentsScreen departmentsScreen = const DepartmentsScreen();
    DoctorsScreen doctorsScreen = DoctorsScreen(false);
    HomeScreenController hmc = HomeScreenController();
    return  Column(
          children: [
            departmentsScreen,
            doctorsScreen,
          ],
        );
  }
}
