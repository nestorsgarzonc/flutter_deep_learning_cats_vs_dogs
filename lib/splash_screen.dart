import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'home_screen.dart';

class MySplash extends StatefulWidget {
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: Home(),
      title: Text('Dogs vs cat', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.black,
    );
  }
}
 