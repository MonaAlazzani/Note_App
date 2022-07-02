import 'package:flutter/material.dart';
import 'package:note_app/components/curd.dart';
import 'package:note_app/components/customtextform.dart';
import 'package:note_app/constants/api_link.dart';
import 'package:note_app/main.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> with Crud {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
 GlobalKey<FormState> formState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Note'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Form(
                key: formState,
                  child: Column(
                children: [
                  CustomTextFormSign(
                      hint: 'Title',
                      controller: title,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Title must be not empty";
                        }
                      }),
                  CustomTextFormSign(
                      hint: 'Content',
                      controller: content,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Note content must be not empty";
                        }
                      }),

                      MaterialButton(onPressed: ()async{
                        await addNote();
                      }, color: Colors.blue,
                       child: Text('ADD', style: TextStyle(color: Colors.white),),)
                ],
              ))
            ],
          ),
        ));
  }

  addNote() async{
    var currentState = formState.currentState;

    if(currentState!.validate()){
      
      var response = await postRequest(add_ApiLink, {
      "id": sharedPref.getString('id'),
      "title": title.text,
      "content": content.text
    });

    if(response['status'] == 'Success'){
       Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false);
    }
    }
    
  }
}
