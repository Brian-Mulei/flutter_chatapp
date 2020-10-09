import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatapp/helper/authenticate.dart';
import 'package:flutter_chatapp/views/search.dart';


class chatroom extends StatefulWidget {

  @override
  _chatroomState createState() => _chatroomState();
}

class _chatroomState extends State<chatroom> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/muleilogo.png",height: 175,),
        actions:[
          GestureDetector(
            onTap: (){
              auth.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder:(context)=> Authenticate()
              ));
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.exit_to_app)),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>Searchscreen()
        ));
        },


      ),



    );

  }
}
