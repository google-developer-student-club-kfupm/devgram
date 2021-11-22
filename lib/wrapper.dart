import 'package:dev_gram/services/auth.dart';
import 'package:dev_gram/views/main_view.dart';
import 'package:dev_gram/views/sign_in_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Wrapper extends StatelessWidget {
  Wrapper({Key key}) : super(key: key);

  bool isSignedIn = Auth.getUser() != null;

  // if Auth.getUser() == null
  // isSignedIn == false
  // if Auth.getUser() != null
  // isSignedIn == true

  @override
  Widget build(BuildContext context) {
    if (isSignedIn) {
      return MainView();
    } else {
      return SignInView();
    }
  }
}
