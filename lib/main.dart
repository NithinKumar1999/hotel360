import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/bindings/app.bindings.dart';
import 'package:hotel_app/firebase_options.dart';
import 'package:hotel_app/pages/splash_screen/splash_screen.view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      initialBinding: AppGlobalBinding(),
    );
  }
}
