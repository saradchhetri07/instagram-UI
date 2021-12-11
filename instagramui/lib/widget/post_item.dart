import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';

// class postItem extends StatefulWidget {
//   const postItem({Key? key}) : super(key: key);

//   @override
//   _postItemState createState() => _postItemState();
// }

// class _postItemState extends State<postItem> {

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class postItem extends StatelessWidget {
  final String postImg;
  final String profileImg;
  final String name;
  final String caption;
  bool isLoved = true;
  final String viewCount;
  final String likedBy;
  final String dayAgo;

  postItem({
    Key? key,
    required this.postImg,
    required this.profileImg,
    required this.name,
    required this.caption,
    required this.isLoved,
    required this.viewCount,
    required this.likedBy,
    required this.dayAgo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(profileImg),
                              fit: BoxFit.cover),
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
                Icon(
                  LineIcons.verticalEllipsis,
                  color: Colors.white,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: NetworkImage(postImg), fit: BoxFit.cover)),
              //child: Expanded(child: Image(image: NetworkImage(postImg),)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    isLoved ? Loved() : unLoved(),
                    // SvgPicture.asset(
                    //           "assets/images/loved_icon.svg",
                    //           width: 27,
                    //         )
                    //       : SvgPicture.asset(
                    //           "assets/images/love_icon.svg",
                    //           width: 27,
                    //         ),
                    SizedBox(
                      width: 10.0,
                    ),
                    SvgPicture.asset(
                      "assets/images/comment_icon.svg",
                      width: 27,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    SvgPicture.asset(
                      "assets/images/message_icon.svg",
                      width: 27,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SvgPicture.asset(
                    "assets/images/save_icon.svg",
                    width: 27,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'liked by ',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                TextSpan(
                    text: '${likedBy} ',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                TextSpan(
                    text: 'and others',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ]),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: '${name} ',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              TextSpan(
                  text: '${caption} ',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              // TextSpan(text: 'and others',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15)),
            ])),
          )
        ],
      ),
    );
  }

  Widget Loved() {
    return GestureDetector(
      onTap: () {
        setState() {
          isLoved = !isLoved;
        }
      },
      child: SvgPicture.asset(
        "assets/images/loved_icon.svg",
        width: 27,
      ),
    );
  }

  Widget unLoved() {
    return GestureDetector(
      onTap: () {
        print('tapped');
      },
      child: SvgPicture.asset(
        "assets/images/love_icon.svg",
        width: 27,
      ),
    );
  }
}
