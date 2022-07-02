
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  void Function() onTap;
  String title, content;
   NoteCard({ Key? key, required this.onTap , required this.content, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
              onTap: (){
                Navigator.of(context).pushNamed('edit_note');
              },
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
                      title: Text('$title'),
                      subtitle: Text('$content'),
                    ))

                  ],
                ),
              ),
            );
  }
}