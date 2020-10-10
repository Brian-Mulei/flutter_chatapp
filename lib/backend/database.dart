import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{

  getUserByUsername(String username) async {
   return await Firestore.instance.collection("users")
        .where("name", isEqualTo: username)
        .getDocuments();
  }
  getUserByUserEmail(String userEmail) async {
    return await Firestore.instance.collection("users")
        .where("email", isEqualTo: userEmail)
        .getDocuments();
  }
uploadUserInfo(userMap){
    Firestore.instance.collection("users")
        .add(userMap).catchError((e){
          print(e.toString());
    });

}

createChatLobby(String charRoomId,chatRoomMap){
    Firestore.instance.collection("Chatroom")
        .document(charRoomId).setData(chatRoomMap).catchError((e){
          print(e.toString());
    });
}

 addConversation(String chatRoomId, messageMap ) {
   Firestore.instance.collection("Chatroom")
       .document(chatRoomId).collection("chats")
       .add(messageMap)
       .catchError((e) {
     print(e.toString());
   });
 }
   getConversation(String chatRoomId ){
    return Firestore.instance.collection("Chatroom")
         .document(chatRoomId)
         .collection("chats")
    .orderBy("time",descending: false)
         .snapshots();
   }
  getChatRoom(String username){
    return Firestore.instance.collection("Chatroom")
        .where("users", arrayContains: username).snapshots();


  }
}