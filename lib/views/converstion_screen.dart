import 'package:flutter/material.dart';
import 'package:flutter_chatapp/backend/database.dart';
import 'package:flutter_chatapp/helper/constants.dart';
import 'package:flutter_chatapp/widgets/widget.dart';

class ConversationScreen extends StatefulWidget {
  final String chatRoomId;
  ConversationScreen(this.chatRoomId);
  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {

  DatabaseMethods databaseMethods =new DatabaseMethods();
  TextEditingController messageTextEditingController = new TextEditingController();

  Widget ChatMessageList(){

  }
sendMessage(){
    if(messageTextEditingController.text.isNotEmpty) {
      Map<String, String>messageMap = {
      "message":messageTextEditingController.text,
      "sendBy"  :Constants.myName

    };
databaseMethods.getConversation(widget.chatRoomId, messageMap);
}}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Color(0x54FFFFFF),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                      controller: messageTextEditingController,
                        style: TextStyle(
                            color: Colors.white
                        ),
                        decoration:  InputDecoration(
                            hintText: "Type message",
                            hintStyle: TextStyle(
                                color: Colors.white
                            ),
                            border: InputBorder.none
                        ),

                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        sendMessage();
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
                              ),
                            borderRadius: BorderRadius.circular(40)
                          ),
                          padding:EdgeInsets.all(12),
                          child: Image.asset("assets/images/sendbtn.png")

                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
