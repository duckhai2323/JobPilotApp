import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../pages/sign_in_up/sign_in/signin_binding.dart';
import '../../pages/sign_in_up/sign_in/signin_view.dart';
import 'names.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.SIGNIN,
      page: () => SignInPage(),
      binding:  SignInBinding()
    )
  ];
}