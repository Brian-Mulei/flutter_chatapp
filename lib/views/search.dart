import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatapp/backend/database.dart';
import 'package:flutter_chatapp/widgets/widget.dart';
import 'package:flutter/cupertino.dart';


class Searchscreen extends StatefulWidget {

  @override
  _SearchscreenState createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  TextEditingController searchTextEditingController =new TextEditingController();
  DatabaseMethods databaseMethods =new DatabaseMethods();
QuerySnapshot searchSnapshot;
  initiateSearch() {
    databaseMethods.getUserByUsername(searchTextEditingController.text)
        .then((val){
          setState(() {
            searchSnapshot=val;

          });
    });
  }

  createChatRoom(String userName){
    List<String>users =[userName];
    //databaseMethods.createChatLobby()
  }

Widget searchlist(){
  return searchSnapshot !=null? ListView.builder(
         itemCount: searchSnapshot.documents.length ,
         shrinkWrap: true ,
         itemBuilder: (context, index){
        return SearchList(
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
class SearchList extends StatelessWidget {
  final String userName;
  final String userEmail;
  SearchList({this.userName,this.userEmail});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16) ,
      child: Row(
        children:[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName,style:  smalltext(),),
              Text(userEmail,style: smalltext(),)
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){

            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30 )
              ),
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              child: Text("Message", style: textFieldstyle(),),
            ),
          )

        ],
      ),
    );
  }
}
