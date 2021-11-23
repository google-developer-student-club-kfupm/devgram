import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_gram/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireStorageServices {
  FirebaseStorage storage = FirebaseStorage.instance;
  static Future<String> uploadFile(File image, String postId) async {
    User user = Auth.getUser();
    try {
      String imageUrl = await (await FirebaseStorage.instance.ref('uploads/${user.uid}/posts/${postId}').putFile(image))
          .ref
          .getDownloadURL();
      return (imageUrl);
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }
}
