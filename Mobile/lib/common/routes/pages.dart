import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:jobpilot_app/pages/application/home/home_binding.dart';
import 'package:jobpilot_app/pages/application/home/home_view.dart';
import 'package:jobpilot_app/pages/chat/chat_binding.dart';
import 'package:jobpilot_app/pages/chat/chat_view.dart';
import 'package:jobpilot_app/pages/companies/companies_binding.dart';
import 'package:jobpilot_app/pages/companies/companies_view.dart';
import 'package:jobpilot_app/pages/jobdetails/jobdetails_binding.dart';
import 'package:jobpilot_app/pages/jobdetails/jobdetails_view.dart';
import 'package:jobpilot_app/pages/notification/notification_binding.dart';
import 'package:jobpilot_app/pages/notification/notification_view.dart';
import 'package:jobpilot_app/pages/sign_in_up/sign_up/signup_binding.dart';
import 'package:jobpilot_app/pages/sign_in_up/sign_up/signup_view.dart';

import '../../pages/application/application_binding.dart';
import '../../pages/application/application_view.dart';
import '../../pages/application/cv_manage/cv_manage_binding.dart';
import '../../pages/application/cv_manage/cv_manage_view.dart';
import '../../pages/sign_in_up/sign_in/signin_binding.dart';
import '../../pages/sign_in_up/sign_in/signin_view.dart';
import 'names.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.APPLICATION,
      page: ()=>ApplicationPage(),
      binding: ApplicationBindings(),
    ),
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
    ),
    GetPage(
      name: AppRoutes.NOTIFICATION,
      page: () => NotificationPage(),
      binding: NotificationBinding(),
    ),

    GetPage(
      name: AppRoutes.JOBDETAILS,
      page: ()=>JobDetailsPage(),
      binding: JobDetailsBinding(),
    ),

    GetPage(
      name: AppRoutes.CHAT,
      page: ()=>ChatPage(),
      binding: ChatBinding(),
    ),

    GetPage(
      name: AppRoutes.CVMANAGE,
      page: ()=>CVManage(),
      binding: CVManageBinding(),
    ),
      
    GetPage(
      name: AppRoutes.COMPANIES,
      page: ()=>CompaniesPage(),
      binding: CompaniesBinding(),
    ),
  ];
}