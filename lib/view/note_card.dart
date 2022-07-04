
import 'package:flutter/material.dart';
import 'package:note_app/app/notes/edit.dart';
import 'package:note_app/components/note_model.dart';

class NoteCard extends StatelessWidget {
  void Function() onTap;
   void Function() onDelete;
  final NoteModel note;
   NoteCard({ Key? key, required this.onTap , required this.note, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
              onTap: onTap,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.network('https://images.unsplash.com/photo-1526662092594-e98c1e356d6a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGtpZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60'
                    ,width:80,height: 80, fit: BoxFit.fill,)),

                    Expanded(
                      flex: 2,
                      child: ListTile(
                      title: Text('${note.noteTitle}'),
                      subtitle: Text('${note.noteContent}'),
                      trailing: InkWell(
                        onTap: onDelete,
                        child: Icon(Icons.delete)),
                    ))

                  ],
                ),
              ),
            );
  }
}