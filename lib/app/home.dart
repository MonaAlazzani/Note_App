
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:note_app/app/notes/edit.dart';
import 'package:note_app/components/curd.dart';
import 'package:note_app/components/note_model.dart';
import 'package:note_app/constants/api_link.dart';
import 'package:note_app/main.dart';
import 'package:note_app/view/note_card.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with Crud{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),
      actions: [
        IconButton(onPressed: (){
          sharedPref.clear();
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
        }, icon: Icon(Icons.exit_to_app))
      ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).pushReplacementNamed('add_note');
      },child: Icon(Icons.add),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: ListView(
          children: [
           FutureBuilder(
          future: viewNote(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
           
            if(snapshot.hasData){
               if(snapshot.data['status'] == 'Fail') 
                    return Center(child: Text('No notes found'));
             return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data['data'].length,
              itemBuilder: (content, index){
                return NoteCard(
                onTap:  (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)
                 => EditNote(note: snapshot.data['data'][index])));
              }, 
                note: NoteModel.fromJson(snapshot.data['data'][index]),
                 onDelete: ()async{
                  await deleteNote(snapshot.data['data'][index]['note_id']);
                  setState(() {
                    
                  });
                 },
                 
                 );
              }
              
              );

            }  if( snapshot.connectionState == ConnectionState.waiting){
              Center(child: CircularProgressIndicator(),);
            }
            return Center(child: CircularProgressIndicator(),);
           })
          ],
        ),
      ),
    );
  }

 

Future viewNote()async{
  var response = await postRequest(view_ApiLink, {
    'id': sharedPref.getString('id')
  });

  return response;
 }

  deleteNote(id) async{
    var response = await postRequest(delete_ApiLink, {
      "id": id.toString()
    });
    return response;
  }

}