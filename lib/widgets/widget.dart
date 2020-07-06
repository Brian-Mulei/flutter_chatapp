import 'package:flutter/material.dart';
 Widget appBarMain(BuildContext context){
   return AppBar(
  title: Image.asset("assets/images/muleilogo.png",height: 175,),


   );
 }

 InputDecoration textFieldInputDecoration(String hintText){
   return InputDecoration(
       hintText: hintText,
       hintStyle: TextStyle(
           color:Colors.white
       ),
       focusedBorder: UnderlineInputBorder(
           borderSide: BorderSide(color: Colors.blue)
       ),

       enabledBorder: UnderlineInputBorder(
           borderSide: BorderSide(color: Colors.white)
       )
   );
 }

 TextStyle textFieldstyle() {
   return TextStyle(
       color: Colors.white,
       fontSize: 16
   );
 }
TextStyle smalltext() {
  return TextStyle(
      color: Colors.white,
      fontSize: 13
  );
}