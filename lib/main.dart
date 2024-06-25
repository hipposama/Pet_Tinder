import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(PetTinderApp());
}

class PetTinderApp extends StatelessWidget {
  const PetTinderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Tinder',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Color(0xFFFF5864), // Tinder primary color
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xFFFFC107), // Tinder accent color
        ),
        scaffoldBackgroundColor:
            Colors.white, // Set the background color to white
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white, // Set AppBar background color to white
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(
              color: Colors.black), // Set AppBar icon color to black
          actionsIconTheme: IconThemeData(
              color: Colors.black), // Set AppBar action icon color to black
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFFFF5864), // Button color
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
