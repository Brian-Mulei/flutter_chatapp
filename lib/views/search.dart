import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatapp/backend/database.dart';
import 'package:flutter_chatapp/helper/constants.dart';
import 'package:flutter_chatapp/views/converstion_screen.dart';
import 'package:flutter_chatapp/widgets/widget.dart';
import 'package:flutter/cupertino.dart';


class Searchscreen extends StatefulWidget {

  @override
  _SearchscreenState createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  TextEditingController searchTextEditingController = new TextEditingController();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  QuerySnapshot searchSnapshot;

  Widget SearchTile({String userName, String userEmail}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName, style: smalltext(),),
              Text(userEmail, style: smalltext(),)
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              createChatRoom(
              userName:userName
                  );

            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Message", style: textFieldstyle(),),
            ),
          )

        ],
      ),
    );
  }

  initiateSearch() {
    databaseMethods.getUserByUsername(searchTextEditingController.text)
        .then((val) {
      setState(() {
        searchSnapshot = val;
      });
    });
  }

  createChatRoom({String userName}) {
    if(userName !=Constants.myName){
    String chatRoomId = getChatRoomId(userName, Constants.myName);

    List<String>users = [userName, Constants.myName];
    Map<String, dynamic>charRoomMap = {
      "users": users,
      "chatroomId": chatRoomId
    };
    databaseMethods.createChatLobby(chatRoomId, charRoomMap);
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => ConversationScreen()
    ));
  }
}
Widget searchlist(){
  return searchSnapshot !=null? ListView.builder(
         itemCount: searchSnapshot.documents.length ,
         shrinkWrap: true ,
         itemBuilder: (context, index){
        return SearchTile(
          userName: searchSnapshot.documents[index].data["name"],
          userEmail: searchSnapshot.documents[index].data["email"],
        );
         }): Container();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Color(0x54FFFFFF),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchTextEditingController,
                      style: TextStyle(
                          color: Colors.white
                      ),
                      decoration:  InputDecoration(
                        hintText: "search username...",
                        hintStyle: TextStyle(
                          color: Colors.white
                        ),
                        border: InputBorder.none
                      ),

                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      initiateSearch();

                    },
                    child: Container(
                      height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                const Color(0x36FFFFFF),
                                const Color(0x0FFFFFFF)
 ]
                          )
                        ),
                        padding:EdgeInsets.all(12),
                        child: Image.asset("assets/images/search.png")

                    ),
                  )
                ],
              ),
            ),
            searchlist()
          ],
        ),
      ),
    );
  }


}

getChatRoomId(String a,String b){
  if(a.substring(0,1).codeUnitAt(0)>b.substring(0,1).codeUnitAt(0)) {
    return "$b\_$a";
  }else{
    return "$a\_$b";
  }
  }

