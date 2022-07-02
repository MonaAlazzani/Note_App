import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/app/auth/login.dart';
import 'package:note_app/app/auth/signup.dart';
import 'package:note_app/app/home.dart';
import 'package:note_app/app/notes/add.dart';
import 'package:note_app/app/notes/edit.dart';
import 'package:shared_preferences/shared_preferences.dart';


 late SharedPreferences sharedPref;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
));
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      initialRoute: sharedPref.getString("id") == null ? "/" : "home",
      routes: {
        "/": (context) => Login(),
        "signup": (context) => Signup(),
        "home": (context) => Home(),
        "add_note": (context) => AddNote(),
        "edit_note": (context) => EditNote()

      },
    );
  }
}


