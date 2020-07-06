import 'package:flutter/cupertino.dart';
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
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                ),
              ),
              SizedBox(height: 10,),
              Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xff007ef4),
                  const Color(0xff2a75dc),
              ]
              ),
                 borderRadius: BorderRadius.circular(30)
            ),
              child: Text("Sign In", style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              )
          ),
              SizedBox(height: 16,),
              Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                     color: Colors.white,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Text("Sign In with Google", style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),


                  )
              ),
              SizedBox(height: 10,),
              Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account? ", style: smalltext()),
              Text("Register now", style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                decoration: TextDecoration.underline
              )),

            ],
          ),

            ],
          )

        ),
      )


    );
  }
}
