import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loc_camp_app/core/internet_checker/logic/internet_checker_cubit.dart';
import 'package:loc_camp_app/core/networking/internet_checker.dart';
import 'package:loc_camp_app/features/notification/data/repo/notification_api_call.dart';
import 'package:loc_camp_app/features/notification/data/repo/notification_repo.dart';
import 'package:loc_camp_app/features/notification/logic/notification_cubit.dart';
import 'package:loc_camp_app/features/users/data/repo/remot_user_repo/remot_user_repo.dart';
import 'package:loc_camp_app/features/users/data/repo/user_repo.dart';
import 'package:loc_camp_app/features/users/logic/users_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/repo/auth_repo.dart';
import '../../features/auth/logic/sign-up_cubit/sign_up_cubit.dart';
import '../../features/auth/logic/sign_in_cubit/sign_in_cubit.dart';
import '../../features/users/data/repo/local_user_repo/local_user_repo.dart';
import '../networking/api_service/dio_factory.dart';
import '../service/notification_service/notification_service.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async{
  // firebaseAuth
  final firebaseauth = FirebaseAuth.instance;
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(firebaseauth));

  /// Register cubit
  getIt.registerFactory(() => SignupCubit(getIt(),getIt()));

  /// create instance from SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  /// login cubit
  getIt.registerFactory(() => SignInCubit(internetChecker: getIt(), authRepo: getIt(), sharedPreferences: sharedPreferences));

  /// Dio & NotificationAPI
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<NotificationApiCall>(
      () => NotificationApiCall(dio));
  getIt
      .registerLazySingleton<NotificationRepo>(() => NotificationRepo(getIt()));

  /// FirebaseMessaging.instance
  final messaging = FirebaseMessaging.instance;

  /// LocalNotification
  final localNotification = FlutterLocalNotificationsPlugin();

  /// NotificationService
  getIt.registerLazySingleton<NotificationService>(
      () => NotificationService(getIt(), messaging, localNotification));

  /// notification cubit
  getIt.registerFactory(() => NotificationCubit(getIt()));

  /// Internet Connection Checker
  getIt.registerLazySingleton(() => InternetCheckerImpl(getIt()));
  getIt.registerLazySingleton(() => InternetConnectionChecker());
  /// internet connection cubit
  getIt.registerFactory(() => InternetCheckerCubit(getIt()));

  /// user remot repo
  getIt.registerLazySingleton(() => UserRemotApiRepo(dio));
  getIt.registerLazySingleton(() => UserRemotRepo(getIt()));


  /// user local repo
  getIt.registerLazySingleton(() => UserLocalRepo(sharedPreferences: sharedPreferences));

  /// user repo
  getIt.registerLazySingleton(() => UserRepo(internetChecker: getIt(),remotUserRepo: getIt(),userLocalRepo: getIt()));

  /// user cubit
  getIt.registerFactory(() => UsersCubit(getIt(), getIt(),getIt()));
}
