import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loc_camp_app/core/internet_checker/logic/internet_checker_cubit.dart';
import 'package:loc_camp_app/core/internet_checker/logic/internet_checker_cubit.dart';
import 'package:loc_camp_app/features/users/logic/users_cubit.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'features/auth/logic/sign-up_cubit/sign_up_cubit.dart';
import 'features/auth/logic/sign_in_cubit/sign_in_cubit.dart';
import 'features/notification/logic/notification_cubit.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCheckerCubit>(
          create: (context) => getIt<InternetCheckerCubit>(),
        ),
        BlocProvider<UsersCubit>(
          create: (context) => getIt<UsersCubit>(),
        ),
        BlocProvider<NotificationCubit>(
          create: (context) => getIt<NotificationCubit>(),
        ),
        BlocProvider<SignInCubit>(
          create: (context) => getIt<SignInCubit>(),
        ),
        BlocProvider<SignupCubit>(create: (context) => getIt<SignupCubit>()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          child: MaterialApp(
            title: 'My App',
            theme: ThemeData(
              //primaryColor: ColorsManager.mainBlue,
              scaffoldBackgroundColor: Colors.white,
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.onBoardingScreen,
            onGenerateRoute: appRouter.generateRoute,
          )),
    );
  }
}
