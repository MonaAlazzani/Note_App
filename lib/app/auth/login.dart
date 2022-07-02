
import 'package:flutter/material.dart';
import 'package:note_app/components/curd.dart';
import 'package:note_app/components/customtextform.dart';
import 'package:note_app/constants/api_link.dart';
import 'package:note_app/main.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
   TextEditingController email= TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();
  Crud _crud =Crud();

  login()async{
    var currentState = formstate.currentState;

    if(currentState!.validate()){
      var response = await  _crud.postRequest(loginLink, {
        "email": email.text,
        "password": password.text
    });
   if(response['status'] == 'Success'){
    sharedPref.setString('id', response['data']['user_id'].toString());
    sharedPref.setString('email', response['data']['email']);
    sharedPref.setString('password', response['data']['password']);
      Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false);
  }else{
    print('=========Login Fail========');
  }
    }
  }


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
                CustomTextFormSign(hint: 'Email', controller: email,validator:(val){
                  if (val!.isEmpty){
                    return 'This field should not be empty';
                  }
                } ),
                CustomTextFormSign(hint: 'Password', controller: password,validator:(val){
                  if (val!.length < 5){
                    return 'This field should not be less than 5';
                  }
                } ),
                 SizedBox(height: 20,),
                MaterialButton(onPressed: ()async{
                    await login();
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