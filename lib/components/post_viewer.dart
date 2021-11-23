import 'package:dev_gram/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PostViewer extends StatelessWidget {
  const PostViewer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Image.network(
                "https://firebasestorage.googleapis.com/v0/b/fozan-kh.appspot.com/o/watermelon.png?alt=media&token=0c4c219d-4376-432b-a3b7-598e42803bb9",
                height: 30,
              ),
              SizedBox(width: 10),
              Text('Ruffles'),
              Spacer(),
              SvgPicture.asset(kMoreSvgAsset),
            ],
          ),
        ),
        Image.network(
          "https://assets2.razerzone.com/images/pnx.assets/a1f5964573ff5aff38ade71ce3a97d22/go-green-hero-mobile-v2.jpg",
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(kHeartSvgAsset),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SvgPicture.asset(kCommentSvgAsset),
                  ),
                  SvgPicture.asset(kShareSvgAsset),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text('100 Likes'),
              ),
              RichText(
                text: TextSpan(
                  text: 'Developer ',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt... more',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ),
              // Text(
              //     'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt... more')
            ],
          ),
        ),
      ],
    );
  }
}
