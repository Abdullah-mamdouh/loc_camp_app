import 'package:flutter/material.dart';
import 'package:loc_camp_app/features/auth/ui/sign_in_screen/login_screen.dart';
import 'package:loc_camp_app/features/auth/ui/sign_up_screen/sign_up_screen.dart';
import 'package:loc_camp_app/features/users/ui/home_screen.dart';
import 'package:loc_camp_app/splash_screen/widgets/splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return PageTransition(
        type: PageTransitionType.rightToLeftWithFade,
        child: SplashScreen(),);
      case Routes.loginScreen:
        return PageTransition(
          type: PageTransitionType.leftToRightWithFade,
          child: const SigninScreen(),);
      case Routes.signupScreen:
        return PageTransition(
          type: PageTransitionType.bottomToTop,
          child: const SignupScreen(),);
      case Routes.homeScreen:
        return PageTransition(
          type: PageTransitionType.leftToRightWithFade,
          child: const HomeScreen(),);
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
