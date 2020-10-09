import 'package:flutter/material.dart';
import 'package:flutter_chatapp/widgets/widget.dart';
import 'package:flutter/cupertino.dart';


class Searchscreen extends StatefulWidget {

  @override
  _SearchscreenState createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  TextEditingController searchTextEditingController =new TextEditingController();

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
                  Container(
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


                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
