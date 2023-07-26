import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth {
  static Future<User?> register(
      {required String name,
      required String email,
      required String password}) async {
    FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
    Map<String, dynamic> mymap = {
      "name": name,
      "email": email,
    };
    firebaseDatabase.ref().child("my_profile").set(mymap);
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Map<String, dynamic> usermap = {"email": email, "password": password};
    firebaseFirestore.collection("users").doc().set(usermap);
    User? user;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      user = userCredential.user;
      user!.updateDisplayName(name);
      user.reload();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password is too weak');
      } else if (e.code == 'email-already-in-use') {
        print('The account is already exists for that email');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  static Future<User?> login(String email, String password) async {
    User? user;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
      user!.reload();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }
}
