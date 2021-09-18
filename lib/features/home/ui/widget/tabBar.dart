import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_dating_cdcnpm/features/chat/ui/page/chatPage.dart';
import 'package:flutter_dating_cdcnpm/features/chat/ui/profile/ui/page/profile.dart';
import 'package:flutter_dating_cdcnpm/features/home/ui/page/homepage.dart';
import 'package:flutter_dating_cdcnpm/features/readInfor/ui/page/readNews.dart';
import 'package:flutter_dating_cdcnpm/routes/route_name.dart';

// Widget navigationBar(BuildContext context) {
//   return CurvedNavigationBarWidget(
//     color: Colors.white,
//     backgroundColor: Colors.transparent,
//     buttonBackgroundColor: Colors.blueAccent,
//     height: 50.0,
//     items: <Widget>[
//       IconButton(
//         onPressed: () {},
//         icon: Icon(Icons.home),
//         iconSize: 25.0,
//         color: Colors.grey,
//       ),
//       IconButton(
//         onPressed: () {},
//         icon: Icon(Icons.book),
//         iconSize: 25.0,
//         color: Colors.grey,
//       ),
//       IconButton(
//         onPressed: () {
//           Navigator.pushNamed(context, RouteName.chatPage);
//         },
//         icon: Icon(Icons.chat),
//         iconSize: 25.0,
//         color: Colors.grey,
//       ),
//       IconButton(
//         onPressed: () {},
//         icon: Icon(Icons.people),
//         iconSize: 25.0,
//         color: Colors.grey,
//       ),
//     ],
//   );
// }

class CurvedNavigationBarWidget extends StatefulWidget {
  const CurvedNavigationBarWidget({Key? key}) : super(key: key);

  @override
  _CurvedNavigationBarWidgetState createState() =>
      _CurvedNavigationBarWidgetState();
}

class _CurvedNavigationBarWidgetState extends State {
  GlobalKey _NavKey = GlobalKey();

  var PagesAll = [HomePage(), ReadNewsPage(), ChatPage(), ProfilePage()];

  var myindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        height: 50,
        key: _NavKey,
        items: [
          Icon((myindex == 0) ? Icons.home_outlined : Icons.home),
          Icon((myindex == 1) ? Icons.message : Icons.message_outlined),
          Icon((myindex == 2) ? Icons.favorite_border : Icons.favorite),
          Icon((myindex == 3)
              ? Icons.perm_identity
              : Icons.perm_contact_cal_rounded)
        ],
        buttonBackgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            myindex = index;
          });
        },
        animationCurve: Curves.fastLinearToSlowEaseIn,
        color: Colors.orange,
      ),
      body: PagesAll[myindex],
    );
  }
}
