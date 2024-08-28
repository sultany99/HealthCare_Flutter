import 'package:flutter/material.dart';
import 'package:hc_2/theme/darkTheme.dart';
import 'package:hc_2/theme/lightTheme.dart';
import 'features/authentication/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HealthCare',
      theme: lightTheme,
      // darkTheme: darkTheme,
      home: const SafeArea(
        child: Login(),
      ),
    );
  }
}
