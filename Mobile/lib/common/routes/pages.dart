import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:jobpilot_app/pages/application/home/home_binding.dart';
import 'package:jobpilot_app/pages/application/home/home_view.dart';
import 'package:jobpilot_app/pages/sign_in_up/sign_up/signup_binding.dart';
import 'package:jobpilot_app/pages/sign_in_up/sign_up/signup_view.dart';

import '../../pages/sign_in_up/sign_in/signin_binding.dart';
import '../../pages/sign_in_up/sign_in/signin_view.dart';
import 'names.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.SIGNIN,
      page: () => SignInPage(),
      binding:  SignInBinding()
    ),
    GetPage(
        name: AppRoutes.SIGNUP,
        page: () => SignUpPage(),
        binding:  SignUpBinding()
    ),
    GetPage(
        name: AppRoutes.HOME,
        page: () => HomePage(),
        binding:  HomeBinding()
    )
  ];
}