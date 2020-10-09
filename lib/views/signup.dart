import 'package:flutter/material.dart';
import 'package:flutter_chatapp/backend/auth.dart';
import 'package:flutter_chatapp/backend/database.dart';
import 'package:flutter_chatapp/views/chatroomscreen.dart';
import 'package:flutter_chatapp/widgets/widget.dart';

// ignore: camel_case_types
class signup extends StatefulWidget {


  final Function toggle;

  signup( this.toggle );
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {

  bool isLoading =false;
  DatabaseMethods databaseMethods =new DatabaseMethods();
  Authenticate  authenticate = new Authenticate();

  final formKey =GlobalKey<FormState>();
  TextEditingController userNameTextEdittingControllerr = new TextEditingController();
  TextEditingController emailTextEdittingControllerr = new TextEditingController();
  TextEditingController passwordTextEdittingControllerr = new TextEditingController();

  signmeup(){
if(formKey.currentState.validate()){

  Map<String, String> userMap={
    "name" : userNameTextEdittingControllerr.text,
    "email" : emailTextEdittingControllerr.text
  };
setState(() {
  isLoading=true;
});

authenticate.signUpWithEmail(emailTextEdittingControllerr.text, 
    passwordTextEdittingControllerr.text).then((value) {
  print("$value");


databaseMethods.uploadUserInfo(userMap);
Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context)=>chatroom()
    ));

});
}}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading? Container(
          child: Center(child: CircularProgressIndicator()),
      ): SingleChildScrollView(
        child:Container(
    height: MediaQuery.of(context).size.height -50,
        alignment: Alignment.center,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:[
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (val){
                      return val.isEmpty || val.length<3? "Provide another username": null;
                        },
                        controller: userNameTextEdittingControllerr,
                        style: textFieldstyle(),
                        decoration: textFieldInputDecoration("username"),
                      ),
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
                      ),
                    ],
                  ),
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
                    signmeup();
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
                      child: Text("Sign Up", style: TextStyle(
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
                    child: Text("Sign Up with Google", style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),


                    )
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ", style: smalltext()),
                    GestureDetector(
                      onTap: (){
                        widget.toggle();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("Log in now", style: TextStyle(
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
        )
        ),
      ),
      
    );
  }
}
