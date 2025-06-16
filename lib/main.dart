import 'package:chat_app/Screens/Homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

@override
Widget build(BuildContext context) {
  return MaterialApp(
    theme: ThemeData(
      primaryColor: Color(0xFF075E54),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Color(0xFF25D366),
      ),
    ),
    home: Homescreen(),
  );
}

}
