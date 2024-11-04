import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:loc_camp_app/core/networking/firebase_service/firebase_constant.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'my_app.dart';


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async{
  await Firebase.initializeApp();
  print(message.notification!.title.toString());
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:  firebaseOptions);
  await setupGetIt();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

