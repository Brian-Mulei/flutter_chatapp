import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chatapp/module/user.dart';

class Authenticate{

final FirebaseAuth auth = FirebaseAuth.instance;
User _user(FirebaseUser user){
return user != null ? User(userId: user.uid):null;

}
Future signInWithEmail(String email, String password) async{
  try{
    AuthResult result =await auth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser firebaseUser =result.user;
    return _user(firebaseUser);
  }catch(e){
    print(e.toString());
  }


}
Future signUpWithEmail(String email, String password) async{
  try{
    AuthResult result =await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser firebaseUser =result.user;
    return _user(firebaseUser);
  }catch(e){
    print(e);
  }


}
Future resetpassword(String email) async{
  try{
      return await auth.sendPasswordResetEmail
        (email: email);
  }catch(e){
    print(e.toString());
  }
}
Future signOut() async {
  try{
  return await auth.signOut();
  }catch(e){

  }
}
}