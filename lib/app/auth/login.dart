
import 'package:flutter/material.dart';
import 'package:note_app/components/customtextform.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
   TextEditingController email= TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        children: [

          Center(child: Text('📝', style: TextStyle(fontSize: 80),)),
          SizedBox(height: 20,),
          Form(
            key:formstate,
            child: Column(
              children: [
                CustomTextFormSign(hint: 'Email', controller: email,),
                CustomTextFormSign(hint: 'Password', controller: password,),
                 SizedBox(height: 20,),
                MaterialButton(onPressed: (){
                    Navigator.of(context).pushNamed('home');
                },
                color: Colors.amber,
                child: Text('Login', style: TextStyle(fontSize: 20),),
                 ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed('signup');
                    },
                    child: Text('Signup', style: TextStyle(fontSize: 20),))
              ],
            ),
          ),
        ],
      ),
    );
  }
}