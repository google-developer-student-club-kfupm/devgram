import 'dart:ui';

import 'package:dev_gram/constants.dart';
import 'package:dev_gram/views/main_view.dart';
import 'package:dev_gram/views/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpView extends StatefulWidget {
  SignUpView({Key key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String username;
  String password;
  String conformPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    kLogoSvgAsset,
                    width: 209,
                    height: 60,
                  ),
                  SizedBox(height: 40),
                  TextField(
                    onChanged: (value) {
                      username = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      fillColor: Color(0xFFFAFAFA),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Color(0xffC4C4C4), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Color(0xffC4C4C4), width: 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      fillColor: Color(0xffFAFAFA),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Color(0xffC4C4C4), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Color(0xffC4C4C4), width: 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      conformPassword = value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Conform Password',
                      fillColor: Color(0xffFAFAFA),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Color(0xffC4C4C4), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Color(0xffC4C4C4), width: 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  MaterialButton(
                    height: 40,
                    onPressed: () {
                      if ((username?.isNotEmpty ?? false) &&
                          (password?.isNotEmpty ?? false) &&
                          password == conformPassword) {
                        // Sign up
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error, please try again')));
                      }
                    },
                    color: Color(0xff5ACBFE),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInView())),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Have an account?",
                        style: TextStyle(decoration: TextDecoration.none), textAlign: TextAlign.center),
                    SizedBox(width: 5),
                    Text('Sign In!', style: TextStyle(color: Color(0xff5ACBFE)), textAlign: TextAlign.center),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
