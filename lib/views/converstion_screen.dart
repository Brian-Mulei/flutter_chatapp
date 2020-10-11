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
  Stream chatStreams;

  Widget ChatMessageList(){
    return StreamBuilder(
        stream: chatStreams,
        builder: (context,snapshot){
          return snapshot.hasData ? ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context,index)
              {
                return MessageBubble(
                    snapshot.data.documents[index].data["message"],
                    snapshot.data.documents[index].data["sendBy"]==Constants.myName);
              }): Container();
        },
        );

  }
sendMessage(){
    if(messageTextEditingController.text.isNotEmpty) {
      Map<String, dynamic>messageMap = {
      "message":messageTextEditingController.text,
      "sendBy"  :Constants.myName,
        "timestamp": DateTime.now().millisecondsSinceEpoch

    };
databaseMethods.addConversation(widget.chatRoomId, messageMap);
messageTextEditingController.text="";
}}
@override
  void initState() {
databaseMethods.getConversation(widget.chatRoomId).then((val){
  setState(() {
    chatStreams=val;
  });

});
super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Stack(
          children: [
            ChatMessageList(),
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
                                  colors:  [
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
class MessageBubble extends StatelessWidget {
  final String message;
  final bool isSendByme;
  MessageBubble(this.message ,this.isSendByme);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only( left: isSendByme ? 0:24,right: isSendByme? 24:0 ),
      margin: EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width,
      alignment: isSendByme ? Alignment.centerRight: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: isSendByme ? [
                Colors.blue,
              Colors.blueAccent]
                  :[ Colors.grey,
                Colors.grey
              ]
          ),
          borderRadius: isSendByme ?
          BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
            bottomLeft: Radius.circular(24)
          ):
          BorderRadius.only(
    topLeft: Radius.circular(24),
    topRight: Radius.circular(24),
    bottomRight: Radius.circular(24)
          )
    ),
        child: Text(message,style: TextStyle(
            color: Colors.white,
            fontSize: 17
        ),),
      ),
    );
  }
}
