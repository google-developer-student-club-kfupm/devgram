import 'package:dev_gram/services/auth.dart';
import 'package:dev_gram/wrapper.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            height: 40,
            onPressed: () async {
              await Auth.signOut();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Wrapper(),
                  ));
            },
            color: Color(0xFFCB280F),
            child: Text(
              'SignOut',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
