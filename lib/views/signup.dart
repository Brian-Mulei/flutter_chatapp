import 'package:flutter/material.dart';
import 'package:flutter_chatapp/widgets/widget.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController userNameTextEdittingControllerr = new TextEditingController();
  TextEditingController emailTextEdittingControllerr = new TextEditingController();
  TextEditingController passwordTextEdittingControllerr = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body:  Container(
        alignment: Alignment.center,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:[
                TextField(
                  controller: userNameTextEdittingControllerr,
                  style: textFieldstyle(),
                  decoration: textFieldInputDecoration("username"),
                ),
                TextField(
                  controller: emailTextEdittingControllerr,
                  style: textFieldstyle(),
                  decoration: textFieldInputDecoration("email"),
                ),
                TextField(
                  controller: passwordTextEdittingControllerr,
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
                    child: Text("Sign Up", style: TextStyle(
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
                    Text("Log in now", style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        decoration: TextDecoration.underline
                    )),

                  ],
                ),

              ],
            )

        ),
      ),
      
    );
  }
}
