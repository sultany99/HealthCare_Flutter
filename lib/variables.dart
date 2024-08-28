import 'package:flutter/material.dart';



class Variables {

  // Radius
  final double inputFieldRadius;


  // Colors
  final MaterialColor inputFieldBorderColor;
  final MaterialColor inputFieldLabelColor;



  // width
  final double inputFieldBorderWidth;




  // Constructor
  Variables({
    this.inputFieldRadius = 50,
    this.inputFieldBorderColor = const MaterialColor(0xFF000000, <int, Color>{}),
    this.inputFieldLabelColor = const MaterialColor(0xFF000000, <int, Color>{}),
    this.inputFieldBorderWidth = 1,
  });



  MaterialColor getMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;
    final int alpha = color.alpha;

    final Map<int, Color> shades = {
      50: Color.fromARGB(alpha, red, green, blue),
      100: Color.fromARGB(alpha, red, green, blue),
      200: Color.fromARGB(alpha, red, green, blue),
      300: Color.fromARGB(alpha, red, green, blue),
      400: Color.fromARGB(alpha, red, green, blue),
      500: Color.fromARGB(alpha, red, green, blue),
      600: Color.fromARGB(alpha, red, green, blue),
      700: Color.fromARGB(alpha, red, green, blue),
      800: Color.fromARGB(alpha, red, green, blue),
      900: Color.fromARGB(alpha, red, green, blue),
    };

    return MaterialColor(color.value, shades);
  }








}




//MaterialColor(0xFF111249, <int, Color>{})



