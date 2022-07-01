
import 'package:flutter/material.dart';
import 'package:note_app/components/curd.dart';
import 'package:note_app/components/customtextform.dart';
import 'package:note_app/constants/api_link.dart';

class Signup extends StatefulWidget {
  const Signup({ Key? key }) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
   TextEditingController email= TextEditingController();
  TextEditingController password = TextEditingController();
   TextEditingController username = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();
  bool isLoading = false;
  Crud _crud = Crud();

  signup()async{
    isLoading = true;
    setState(() {});

  var response =  await _crud.postRequest(signupLink, {
      'username': username.text,
      'email': email.text,
      'password': password.text
    });
    
    isLoading = false;
    setState(() {});

  if(response['status'] == 'Success'){
      Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false);
  }else{
    print('=========Signup Fail========');
  }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == true ?Center(child: CircularProgressIndicator(),)  : ListView(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        children: [

          Center(child: Text('📝', style: TextStyle(fontSize: 80),)),
          SizedBox(height: 20,),
          Form(
            key:formstate,
            child: Column(
              children: [
                CustomTextFormSign(hint: 'Username', controller: username,),
                CustomTextFormSign(hint: 'Email', controller: email,),
                CustomTextFormSign(hint: 'Password', controller: password,),
                 SizedBox(height: 20,),
                MaterialButton(onPressed: ()async{
                 
                  await  signup();
                },
                color: Colors.amber,
                child: Text('Signup', style: TextStyle(fontSize: 20),),
                 ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed('/');
                    },
                    child: Text('Login', style: TextStyle(fontSize: 20),))
              ],
            ),
          ),
        ],
      ),
    );
  }
}