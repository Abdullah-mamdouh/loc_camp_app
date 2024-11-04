import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loc_camp_app/core/helpers/extensions.dart';
import 'package:loc_camp_app/features/auth/logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:loc_camp_app/features/auth/ui/sign_in_screen/login_screen.dart';
import 'package:loc_camp_app/features/notification/logic/notification_cubit.dart';
import 'package:loc_camp_app/features/users/ui/home_screen.dart';
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
          seconds: 4,
        ),
        () => context.pushNamed(widgetAppear(context)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0.0),
          height: MediaQuery.of(context).size.height * 0.50.h,
          width: double.infinity,
          child: Image.asset("images/loc-camp.gif"),
        ),
      ),
    );
  }

  String widgetAppear(BuildContext context){
    bool isLogin = context.read<SignInCubit>().emailController.text != null ? true : false;
    return //isLogin ? Routes.homeScreen :
    Routes.loginScreen;
  }
}
