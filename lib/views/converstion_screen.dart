import 'package:flutter/material.dart';
import 'package:flutter_chatapp/widgets/widget.dart';

class ConversationScreen extends StatefulWidget {
  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {

  Widget ChatMessageList(){

  }
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
                      //  controller: searchTextEditingController,
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
                     //   initiateSearch();

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
