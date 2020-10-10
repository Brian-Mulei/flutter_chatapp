import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatapp/backend/database.dart';
import 'package:flutter_chatapp/helper/authenticate.dart';
import 'package:flutter_chatapp/helper/constants.dart';
import 'package:flutter_chatapp/helper/helperfunction.dart';
import 'package:flutter_chatapp/views/search.dart';


class chatroom extends StatefulWidget {

  @override
  _chatroomState createState() => _chatroomState();
}

class _chatroomState extends State<chatroom> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Authenticate authenticate =new Authenticate();
  DatabaseMethods databaseMethods =new DatabaseMethods();
  Stream chatRoomStream;

  Widget chatRoomList(){
    return StreamBuilder(
      stream: chatRoomStream,
      builder: (context,snapshot){
        return ListView.builder(
            itemCount:  snapshot.data.documents.length,
            itemBuilder: (context,index){
              return
            });
      },
    );
  }
@override
  void initState() {
    getUserInfo();
    databaseMethods.getChatRoom(Constants.myName).then((val){

    });
    super.initState();
  }
  getUserInfo() async {
  Constants.myName= await HelperFunctions.getUserNameSharedPreference();
  }
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

class chatRoomsTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
