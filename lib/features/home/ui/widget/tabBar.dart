import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

Widget navigationBar() {
  return CurvedNavigationBar(
    color: Colors.white,
    backgroundColor: Colors.transparent,
    buttonBackgroundColor: Colors.blueAccent,
    
    height: 60.0,
    items: <Widget>[
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.home),
        iconSize: 30.0,
        color: Colors.grey,
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.info),
        iconSize: 30.0,
        color: Colors.grey,
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.chat),
        iconSize: 30.0,
        color: Colors.grey,
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.people),
        iconSize: 30.0,
        color: Colors.grey,
      ),
    ],
  );
}
