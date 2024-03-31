import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/sign_in_up/sign_in/signin_view.dart';

import 'common/routes/names.dart';
import 'common/routes/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'JobPilot App',
      theme: ThemeData(
        //fontFamily: 'Roboto Regular',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.SIGNUP,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
    );
  }
}
