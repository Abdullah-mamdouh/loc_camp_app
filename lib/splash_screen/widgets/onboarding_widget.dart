import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loc_camp_app/core/helpers/extensions.dart';
import 'package:loc_camp_app/features/notification/logic/notification_cubit.dart';
import '../../core/routing/routes.dart';
import '../../core/theming/colors.dart';

class OnBoardingWidget extends StatefulWidget {
  const OnBoardingWidget({Key? key}) : super(key: key);

  @override
  _OnBoardingWidgetState createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {

  @override
  void initState() {

    NotificationCubit.get(context).emitNotificationStates(context);
    Timer(
        Duration(
          seconds: 1,
        ),
        () => context.pushNamed(Routes.signupScreen));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:
          // Provider.of<ThemeColor>(context, listen: false).valueTheme
          //     ? ColorsManager.lightGray
          //     : constantColors.darkColor,
      //constantColors.darkColor,
      body: Center(
        child: RichText(
          text: TextSpan(
              text: 'The',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: ColorsManager.lightGray,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Social',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: ColorsManager.lightGray,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
