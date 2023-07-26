import 'package:cloud_firestore/cloud_firestore.dart';

class ChatOperation {
  Future<void> chat_operations(
      {required String content,
      required String idfrom,
      required String idTo,
      required String type}) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Map<String, dynamic> chatmap = {
      "content": content,
      "IdFrom": idfrom,
      "IdTo": idTo,
      "Type": type,
    };
    firebaseFirestore.collection("chat").doc(type).set(
          chatmap,
        );
  }
}
