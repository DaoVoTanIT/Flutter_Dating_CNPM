import 'package:flutter/material.dart';

class InforWidget extends StatelessWidget {
  int numFriend;
  int comment;
  int bookmarks;
  InforWidget({
    Key? key,
    required this.numFriend,
    required this.comment,
    required this.bookmarks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0, left: 42, right: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$numFriend',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold)),
                Text("Friends",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.8), fontSize: 12.0))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$comment',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold)),
                Text("Comments",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.8), fontSize: 12.0))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$bookmarks',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold)),
                Text("Bookmarks",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.8), fontSize: 12.0))
              ],
            )
          ],
        ),
      ),
    );
  }
}
