import 'package:flutter/material.dart';
import 'package:instagramui/theme/colors.dart';

class StoryItem extends StatelessWidget {
  final String img;
  final String name;

  const StoryItem({Key? key, required this.img, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 30.0),
      child: Column(
        children: [
          Container(
              height: 68,
              width: 68,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: storyBorderColor)),
              child: Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.green, width: 2),
                  image: DecorationImage(
                      image: NetworkImage(img), fit: BoxFit.cover),
                ),
              )),
          // SizedBox(
          //   height: 5.0,
          // ),
          SizedBox(
            width: 70,
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: white),
            ),
          )
        ],
      ),
    );
  }
}
