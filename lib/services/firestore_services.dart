import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_gram/models/post.dart';

class FirestoreServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference users = FirebaseFirestore.instance.collection('users');
  static CollectionReference posts = FirebaseFirestore.instance.collection('posts');

  static Future<void> addPost(Post post) {
    // Call the user's CollectionReference to add a new user

    return posts
        .doc(post.id)
        .set(post.toMap())
        .then((value) => print("Post Added"))
        .catchError((error) => print("Failed to add post: $error"));
  }
}
