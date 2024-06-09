import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common/routes/names.dart';
import 'common/routes/pages.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseOptions firebaseOptions = const FirebaseOptions(
      apiKey: 'AIzaSyC0SU-UrT3-CpB9R7m84EzdjyxfFiLG3pw',
      appId: '1:916646229332:android:4fdf4aed079beb776e84c1',
      messagingSenderId: '916646229332',
      projectId: 'jobpilot-80666',
      storageBucket: "jobpilot-80666.appspot.com"
  );
  await Firebase.initializeApp(options: firebaseOptions);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const _kFontFam = 'MyFlutterApp';
  static const String? _kFontPkg = null;

  static const IconData dot = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
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
      initialRoute: AppRoutes.SIGNIN,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
    );
  }
}
