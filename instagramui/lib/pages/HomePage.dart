import 'package:flutter/material.dart';
import 'package:instagramui/constant/post_item.dart';
import 'package:instagramui/constant/story_json.dart';
import 'package:instagramui/theme/colors.dart';
import 'package:instagramui/widget/Story_Item.dart';
import 'package:instagramui/widget/post_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 42.0),
                  child: Column(
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        child: Stack(
                          children: [
                            Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(profile),
                                      fit: BoxFit.cover)),
                            ),
                            Positioned(
                                bottom: 0.0,
                                right: 0.0,
                                child: Container(
                                  width: 19.0,
                                  height: 19.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Icon(Icons.add_circle,
                                      color: buttonFollowColor, size: 19),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: 70,
                        child: Text(
                          "sangam kshettri",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: List.generate(stories.length, (index) {
                    return StoryItem(
                        img: stories[index]['img'],
                        name: stories[index]['name']);
                  }),
                )
              ],
            ),
          ),
          Divider(
            color: white,
          ),
          Column(
              children: List.generate(posts.length, (index) {
            return postItem(
              postImg: posts[index]['postImg'],
              profileImg: posts[index]['profileImg'],
              name: posts[index]['name'],
              caption: posts[index]['caption'],
              isLoved: posts[index]['isLoved'],
              viewCount: posts[index]['viewCount'],
              likedBy: posts[index]['likedBy'],
              dayAgo: posts[index]['dayAgo'],
            );
          }))
        ],
      ),
    );
  }
}
