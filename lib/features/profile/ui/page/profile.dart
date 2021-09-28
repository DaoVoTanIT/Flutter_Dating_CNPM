import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dating_cdcnpm/features/home/model/userInfor.dart';
import 'package:flutter_dating_cdcnpm/features/profile/ui/widget/updateInfor.dart';
import 'package:flutter_dating_cdcnpm/routes/route_name.dart';
import 'package:flutter_dating_cdcnpm/routes/router.dart';
import 'package:flutter_dating_cdcnpm/style/styleAppBar.dart';
import 'package:flutter_dating_cdcnpm/style/theme_helper.dart';
import 'package:flutter_dating_cdcnpm/theme/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final User user;

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
            text: 'Profile',
            colors: <Color>[Colors.redAccent, Colors.purpleAccent],
            style: TextStyle(fontSize: 30.0),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.settings),
                color: Colors.grey,
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.settingPage);
                })
          ],
        ),
        body: Stack(
          children: <Widget>[
            Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/images/profile.jpeg"),
                      )),
                      child: Stack(
                        children: <Widget>[
                          SafeArea(
                            bottom: false,
                            right: false,
                            left: false,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0, right: 0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                      backgroundImage:
                                          AssetImage("assets/images/dao.jpeg"),
                                      radius: 65.0),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 24.0),
                                    child: Text("Đào Tấn",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text("Sinh viên",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.85),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 24.0, left: 42, right: 32),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                      child: SingleChildScrollView(
                          child: Column(children: [
                    Text("About me",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 17.0)),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24.0, right: 24, top: 30, bottom: 24),
                      child: Text(
                          "Ta nhận được không phải điều mà ta lười biếng ước ao, mà là điều ta dành được một cách chính đáng. Phần thưởng của ta luôn tỷ lệ thuận với nỗ lực ta bỏ ra. – Earl NightingaleNN,",
                          textAlign: TextAlign.justify,
                          style: TextStyle(color: Colors.black, fontSize: 17)),
                    ),
                    RaisedButton(
                      textColor: Colors.white,
                      color: Colors.redAccent,
                      onPressed: () {
                        updateInfor(context);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 12.0, right: 12.0, top: 10, bottom: 10),
                          child: Text("Cập nhật thông tin",
                              style: TextStyle(fontSize: 13.0))),
                    ),
                  ]))),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.redAccent,
                        onPressed: () {
                          // Respond to button press
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 12.0, right: 12.0, top: 10, bottom: 10),
                            child: Text("Follow",
                                style: TextStyle(fontSize: 13.0))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: RawMaterialButton(
                        constraints: BoxConstraints.tight(Size(38, 38)),
                        onPressed: () {},
                        elevation: 4.0,
                        fillColor: Colors.grey,
                        child: Icon(FontAwesomeIcons.twitter,
                            size: 14.0, color: Colors.white),
                        padding: EdgeInsets.all(0.0),
                        shape: CircleBorder(),
                      ),
                    ),
                    RawMaterialButton(
                      constraints: BoxConstraints.tight(Size(38, 38)),
                      onPressed: () {},
                      elevation: 4.0,
                      fillColor: Colors.grey,
                      child: Icon(FontAwesomeIcons.pinterest,
                          size: 14.0, color: Colors.white),
                      padding: EdgeInsets.all(0.0),
                      shape: CircleBorder(),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
