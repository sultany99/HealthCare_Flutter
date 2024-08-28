import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hc_2/features/portal_screens/appoinment_screen/appointment_screen.dart';
import 'package:hc_2/features/portal_screens/home_screen/home_screen.dart';
import 'package:hc_2/features/portal_screens/home_screen/home_screen_controller.dart';
import 'package:hc_2/features/materials/widgets.dart';
import 'package:hc_2/features/portal_screens/user_profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  HomeScreen homeScreen = HomeScreen();
  ProfileScreen profileScreen = ProfileScreen();
  AppointmentScreen appointmentScreen = AppointmentScreen();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    HomeScreenController hmc = HomeScreenController();
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
            BottomNavigationBarItem(
                icon: Icon(Icons.date_range), label: "المواعيد"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "الملف الشخصي"),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue[600],
          onTap: _onItemTapped,
        ),
        resizeToAvoidBottomInset: false,
        body: Center(
            child: [
          homeScreen,
          appointmentScreen,
          profileScreen,
        ].elementAt(_selectedIndex)));
  }
}
