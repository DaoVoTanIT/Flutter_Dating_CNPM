import 'dart:ui';

import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dating_cdcnpm/features/home/model/userInfor.dart';
import 'package:flutter_dating_cdcnpm/features/home/resources/data.dart';
import 'package:flutter_dating_cdcnpm/features/home/ui/provider/feedback_position_provider.dart';
import 'package:flutter_dating_cdcnpm/features/home/ui/widget/userCard.dart';
import 'package:flutter_dating_cdcnpm/style/styleAppBar.dart';
import 'package:flutter_dating_cdcnpm/theme/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<User> users = dummyUsers;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: StyleAppBar(
          backgroundColor: kBackgroudColor,
          elevation: 0.3,
          height: 60,
          leading: InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsetsDirectional.only(start: 5),
              child: ShaderMask(
                  child: Icon(
                    FontAwesomeIcons.heartBroken,
                    size: 42,
                    color: Colors.redAccent,
                  ),
                  blendMode: BlendMode.srcATop,
                  shaderCallback: (bounds) {
                    return LinearGradient(
                            colors: [
                          Colors.redAccent,
                          Colors.deepPurpleAccent,
                        ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            tileMode: TileMode.repeated)
                        .createShader(bounds);
                  }),
            ),
          ),
          title: GradientText(
            text: 'Dating',
            colors: <Color>[Colors.redAccent, Colors.purpleAccent],
            style: TextStyle(fontSize: 30.0),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.notifications),
                color: Colors.grey,
                onPressed: () {
                  Navigator.of(context).pushNamed('/notification');
                })
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            users.isEmpty
                ? Text('No more users')
                : Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Stack(children: users.map(buildUser).toList()),
                  ),
            Expanded(child: Container()),
            // CurvedNavigationBarWidget() //tab
          ],
        ),
      );
  Widget buildUser(User user) {
    final userIndex = users.indexOf(user);
    final isUserInFocus = userIndex == users.length - 1;

    return Listener(
      onPointerMove: (pointerEvent) {
        final provider =
            Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.updatePosition(pointerEvent.localDelta.dx);
      },
      onPointerCancel: (_) {
        final provider =
            Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.resetPosition();
      },
      onPointerUp: (_) {
        final provider =
            Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.resetPosition();
      },
      child: Draggable(
        child: UserCardWidget(user: user, isUserInFocus: isUserInFocus),
        feedback: Material(
          type: MaterialType.transparency,
          child: UserCardWidget(user: user, isUserInFocus: isUserInFocus),
        ),
        childWhenDragging: Container(),
        onDragEnd: (details) => onDragEnd(details, user),
      ),
    );
  }

  void onDragEnd(DraggableDetails details, User user) {
    final minimumDrag = 100;
    if (details.offset.dx > minimumDrag) {
      user.isSwipedOff = true;
    } else if (details.offset.dx < -minimumDrag) {
      user.isLiked = true;
    }

    setState(() => users.remove(user));
  }
}
