import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatapp/backend/auth.dart';
import 'package:flutter_chatapp/backend/database.dart';
import 'package:flutter_chatapp/helper/helperfunction.dart';
import 'package:flutter_chatapp/widgets/widget.dart';
import 'chatroomscreen.dart';

class Signin extends StatefulWidget {
     final Function toggle;
   Signin( this.toggle);
  @override
  _SigninState createState() => _SigninState();
}
class _SigninState extends State<Signin> {
  final formKey= GlobalKey<FormState>();
  Authenticate authenticate =new Authenticate();
  DatabaseMethods databaseMethods =new DatabaseMethods();
  TextEditingController emailTextEdittingControllerr = new TextEditingController();
  TextEditingController passwordTextEdittingControllerr = new TextEditingController();
bool isLoading =false;
QuerySnapshot snapshotUserInfo;
  signIn(){

    if(formKey.currentState.validate()){
      HelperFunctions.saveUserEmailLoggedInSharedPreference(emailTextEdittingControllerr.text);
      setState(() {
        isLoading =true;
      });
      databaseMethods.getUserByUserEmail(emailTextEdittingControllerr.text)
      .then((val){
        snapshotUserInfo=val;
        HelperFunctions.saveUserEmailLoggedInSharedPreference(snapshotUserInfo.documents[0].data["name"]);
      });
      authenticate.signInWithEmail(emailTextEdittingControllerr.text,
          passwordTextEdittingControllerr.text).then((val){
            if(val != null){
              HelperFunctions.saveUserLoggedInSharedPreference(true);
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context)=>chatroom()
              ));
            }
      }
          );
    }
  }
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
           Form(
             key:formKey ,
             child: Column(children: [
               TextFormField(
               validator: (val){
                 return RegExp(
                     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                     .hasMatch(val) ? null: "Provide acceptable email address";
               },
               controller: emailTextEdittingControllerr,
               style: textFieldstyle(),
               decoration: textFieldInputDecoration("email"),
             ),
               TextFormField(
                 obscureText: true,
                 validator: (val){
                   return val.length>6 ?null: "Password has to be at least 7 characters";
                 },
                 controller: passwordTextEdittingControllerr,
                 style: textFieldstyle(),
                 decoration: textFieldInputDecoration("password"),
               ),],),
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
              GestureDetector(
                onTap: (){
                  signIn();
                },
                child: Container(
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
              GestureDetector(
                onTap: (){
                  widget.toggle();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical:8 ),
                  child: Text("Register now", style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    decoration: TextDecoration.underline
                  )),
                ),
              ),

            ],
          ),

            ],
          )

        ),
      )


    );
  }
}
