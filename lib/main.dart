import 'package:flutter/material.dart';
import 'package:note_app/app/auth/login.dart';
import 'package:note_app/app/auth/signup.dart';
import 'package:note_app/app/home.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Login(),
        "signup": (context) => Signup(),
        "home": (context) => Home()

      },
    );
  }
}


