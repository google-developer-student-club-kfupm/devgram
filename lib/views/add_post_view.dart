import 'dart:io';

import 'package:dev_gram/models/post.dart';
import 'package:dev_gram/services/auth.dart';
import 'package:dev_gram/services/firebase_storage_serivces.dart';
import 'package:dev_gram/services/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({Key key}) : super(key: key);

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  File image;
  String comment;

  @override
  void initState() {
    pickImage();
    super.initState();
  }

  pickImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    image = File(pickedImage?.path);
    if (image == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error, Couldn't pick your image, please try again")));
      Navigator.pop(context);
    }
    print(image?.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text('Add new Post'),
        actionsIconTheme: IconThemeData(color: Colors.black),
      ),
      body: image != null
          ? SafeArea(
              child: Container(
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2)],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: FileImage(image),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        onChanged: (value) => comment = value,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: 'Write your Comment',
                          fillColor: Colors.transparent,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Post post = Post(comment: comment, userId: Auth.getUser().uid);
                        post.imageUrl = await FireStorageServices.uploadFile(image, post.id);
                        if (post.imageUrl != null) {
                          await FirestoreServices.addPost(post);
                          print('done!');
                        }
                        print('error!');
                      },
                      child: Container(
                        height: 40,
                        margin: EdgeInsets.all(20),
                        alignment: Alignment.center,
                        child: Text('Upload', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(5)),
                      ),
                    )
                  ],
                ),
              ),
            )
          : SizedBox(),
    );
  }
}
