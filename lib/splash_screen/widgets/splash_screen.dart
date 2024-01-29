
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loc_camp_app/core/helpers/extensions.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/routing/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 // String animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 2550), () {
      context.pushNamed(Routes.loginScreen);
      // Navigator.pushReplacement(
      //     context,
          // PageTransition(
          //     type: PageTransitionType.rightToLeftWithFade,
          //     child: Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlareActor(
        "images/flar/SplashScreen.flr",
        fit: BoxFit.cover,
        animation:"idle",
      ),
    );
  }
}