import 'package:flutter/material.dart';
import 'package:note_app/components/curd.dart';
import 'package:note_app/components/customtextform.dart';
import 'package:note_app/constants/api_link.dart';
import 'package:note_app/main.dart';

class EditNote extends StatefulWidget {
  var note;
   EditNote({Key? key, required this.note}) : super(key: key);

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> with Crud {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
 GlobalKey<FormState> formState = GlobalKey();

 @override
  void initState() {
    title.text = widget.note['note_title'];
     content.text = widget.note['note_content'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Note'),
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
                        await EditNote();
                      }, color: Colors.blue,
                       child: Text('Save', style: TextStyle(color: Colors.white),),)
                ],
              ))
            ],
          ),
        ));
  }

  EditNote() async{
    var currentState = formState.currentState;

    if(currentState!.validate()){
      
      var response = await postRequest(edit_ApiLink, {
      "id": widget.note['note_id'].toString(),
      "title": title.text,
      "content": content.text
    });

    if(response['status'] == 'Success'){
       Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false);
    }
    }
    
  }
}
