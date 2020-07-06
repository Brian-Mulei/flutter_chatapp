import 'package:flutter/material.dart';
import 'package:flutter_chatapp/widgets/widget.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: appBarMain(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children:[
            TextField(
              style: textFieldstyle(),
              decoration: textFieldInputDecoration("email"),
            ),
            TextField(
              style: textFieldstyle(),
              decoration: textFieldInputDecoration("password"),
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.centerRight,
              child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              child: Text("Forgot Password?" , style: textFieldstyle()),
              )
            )
          ],
        )

      )


    );
  }
}
