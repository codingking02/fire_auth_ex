import 'package:cloud_firestore/cloud_firestore.dart';

class Operations {
  static Future<void> createProduct(
      {required String name,
      required String price,
      required String Imageurl}) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Map<String, dynamic> map = {
      "ProductName": name,
      "ProductPrice": price,
      "ProductImageUrl": Imageurl,
    };
    await firebaseFirestore.collection("products").doc(name).set(
          map,
        );
  }
}
