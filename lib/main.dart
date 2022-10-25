import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // const primaryColor = Color.fromRGBO(99, 63, 211, 1);
    // const secondaryColor = Color.fromRGBO(196, 207, 79, 1);
    const primaryColor = Color.fromRGBO(141, 114, 104, 1);
    const secondaryColor = Color.fromRGBO(211, 195, 176, 1);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'R6 Strats builder',
      theme: ThemeData(
        // COLORS
        primaryColor: primaryColor,
        // primaryColorLight: const Color.fromRGBO(230, 230, 250, 1),
        // primaryColorDark: const Color.fromRGBO(48, 25, 52, 1),
        primaryColorLight: const Color.fromRGBO(169, 146, 138, 1),
        primaryColorDark: const Color.fromRGBO(113, 91, 83, 1),
        colorScheme: const ColorScheme.light(
            primary: primaryColor, secondary: secondaryColor),
        errorColor: const Color(0xE30613),
        // Font Family
        fontFamily: 'Raleway',
        // Text Style
        textTheme: const TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
          displayColor: primaryColor,
        ),
      ),
      home: MyHomePage(),
    );
  }
}
