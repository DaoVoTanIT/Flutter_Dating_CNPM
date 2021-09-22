import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dating_cdcnpm/style/styleAppBar.dart';
import 'package:flutter_dating_cdcnpm/theme/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReadNewsPage extends StatefulWidget {
  const ReadNewsPage({Key? key}) : super(key: key);

  @override
  _ReadNewsPageState createState() => _ReadNewsPageState();
}

class _ReadNewsPageState extends State<ReadNewsPage> {
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
        text: 'News',
        colors: <Color>[Colors.redAccent, Colors.purpleAccent],
        style: TextStyle(fontSize: 30.0),
      ),
      actions: [],
    ));
  }
}
