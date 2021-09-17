import 'package:flutter/material.dart';
import 'package:flutter_dating_cdcnpm/features/home/model/userInfor.dart';
import 'package:flutter_dating_cdcnpm/features/home/resources/data.dart';
import 'package:flutter_dating_cdcnpm/features/home/ui/provider/feedback_position_provider.dart';
import 'package:flutter_dating_cdcnpm/features/home/ui/widget/tabBar.dart';
import 'package:flutter_dating_cdcnpm/features/home/ui/widget/userCard.dart';
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
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            'Tinder like CARDS',
            style: TextStyle(color: Colors.white),
          ),
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
            navigationBar()
          ],
        ),
      );

  Widget buildAppBar() => AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Icon(Icons.chat, color: Colors.grey),
          SizedBox(width: 16),
        ],
        leading: Icon(Icons.person, color: Colors.grey),
        title: FaIcon(FontAwesomeIcons.fire, color: Colors.deepOrange),
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
