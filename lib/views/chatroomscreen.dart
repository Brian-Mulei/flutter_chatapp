import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatapp/backend/database.dart';
import 'package:flutter_chatapp/helper/authenticate.dart';
import 'package:flutter_chatapp/helper/constants.dart';
import 'package:flutter_chatapp/helper/helperfunction.dart';
import 'package:flutter_chatapp/views/search.dart';
import 'package:flutter_chatapp/widgets/widget.dart';


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
        return snapshot.hasData ? ListView.builder(
            itemCount:  snapshot.data.documents.length,
            itemBuilder: (context,index){
              return chatRoomsTile(
                  snapshot.data.documents[index].data["chatroomId"]
                      .toString().replaceAll("_", "")
                      .replaceAll(Constants.myName, "")
                  );
            }): Container();
      },
    );
  }
@override
  void initState() {
    getUserInfo();

    super.initState();
  }
  getUserInfo() async {
  Constants.myName= await HelperFunctions.getUserNameSharedPreference();
  databaseMethods.getChatRoom(Constants.myName).then((val){
    setState(() {
      val=chatRoomStream;

    });
  });
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
      body: chatRoomList(),
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
  final String userName;

 chatRoomsTile(  this.userName);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(40)
            ),
            child: Text("${userName.substring(0,1).toUpperCase()}"),
          ),
          SizedBox(width: 8,),
          Text(userName,style: mediumtextstyle(),)
        ],
      ),
    );
  }
}
