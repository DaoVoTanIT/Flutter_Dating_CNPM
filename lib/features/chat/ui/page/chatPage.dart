import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dating_cdcnpm/features/chat/model/chat.dart';
import 'package:flutter_dating_cdcnpm/features/chat/resource/chat.dart';
import 'package:flutter_dating_cdcnpm/features/chat/ui/widget/listChat.dart';
import 'package:flutter_dating_cdcnpm/style/styleAppBar.dart';
import 'package:flutter_dating_cdcnpm/theme/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: StyleAppBar(
          backgroundColor: kBackgroudColor,
          elevation: 0.0,
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
            text: 'Message',
            colors: <Color>[Colors.redAccent, Colors.purpleAccent],
            style: TextStyle(fontSize: 30.0),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                color: Colors.grey,
                onPressed: () {
                  Navigator.of(context).pushNamed('/notification');
                }),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatsData.length,
                itemBuilder: (context, index) => ChatCard(
                  chat: chatsData[index],
                  press: () {},
                  // press: () => Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => MessagesScreen(),
                  //   ),
                  // ),
                ),
              ),
            ),
          ],
        ));
  }
}
