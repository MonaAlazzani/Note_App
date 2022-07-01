
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      floatingActionButton: FloatingActionButton(onPressed: () {},child: Icon(Icons.add),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: ListView(
          children: [
            InkWell(
              onTap: (){},
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
                      title: Text('Title'),
                      subtitle: Text('Note Content'),
                    ))

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}