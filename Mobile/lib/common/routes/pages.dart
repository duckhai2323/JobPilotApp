import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:jobpilot_app/pages/agent/add_job/add_job_binding.dart';
import 'package:jobpilot_app/pages/agent/add_job/add_job_view.dart';
import 'package:jobpilot_app/pages/agent/edit_company_infor/edit_company_binding.dart';
import 'package:jobpilot_app/pages/agent/edit_company_infor/edit_company_view.dart';
import 'package:jobpilot_app/pages/application/cv_manage/cv_manage_binding.dart';
import 'package:jobpilot_app/pages/application/cv_manage/cv_manage_view.dart';
import 'package:jobpilot_app/pages/application/cv_manage/topcv_profile_page/topcv_profile_binding.dart';
import 'package:jobpilot_app/pages/application/cv_manage/topcv_profile_page/topcv_profile_view.dart';
import 'package:jobpilot_app/pages/chat/chat_binding.dart';
import 'package:jobpilot_app/pages/chat/chat_view.dart';
import 'package:jobpilot_app/pages/companies/companies_binding.dart';
import 'package:jobpilot_app/pages/companies/companies_view.dart';
import 'package:jobpilot_app/pages/jobdetails/applyjob/apply_job.binding.dart';
import 'package:jobpilot_app/pages/jobdetails/applyjob/apply_job_view.dart';
import 'package:jobpilot_app/pages/suitablejob/suitablejob_binding.dart';
import 'package:jobpilot_app/pages/suitablejob/suitablejob_view.dart';
import 'package:jobpilot_app/pages/jobdetails/jobdetails_binding.dart';
import 'package:jobpilot_app/pages/jobdetails/jobdetails_view.dart';
import 'package:jobpilot_app/pages/notification/notification_binding.dart';
import 'package:jobpilot_app/pages/notification/notification_view.dart';
import 'package:jobpilot_app/pages/sign_in_up/sign_up/signup_binding.dart';
import 'package:jobpilot_app/pages/sign_in_up/sign_up/signup_view.dart';
import '../../pages/jobapplied/jobapplied_binding.dart';
import '../../pages/jobapplied/jobapplied_view.dart';
import '../../pages/jobsaved/jobsaved_binding.dart';
import '../../pages/jobsaved/jobsaved_view.dart';
import '../../pages/application/application_binding.dart';
import '../../pages/application/application_view.dart';
import '../../pages/sign_in_up/sign_in/signin_binding.dart';
import '../../pages/sign_in_up/sign_in/signin_view.dart';
import 'names.dart';

class AppPages {
  static final List<GetPage> routes = [
    //Candidate
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
      name: AppRoutes.COMPANIES,
      page: ()=>CompaniesPage(),
      binding: CompaniesBinding(),
    ),

    GetPage(
      name: AppRoutes.SUITABLE_JOB,
      page: ()=>SuitablePage(),
      binding: SuitableBinding(),
    ),

    GetPage(
      name: AppRoutes.JOBAPPLIED,
      page: ()=>JobAppliedPage(),
      binding: JobAppliedBinding(),
    ),


    GetPage(
      name: AppRoutes.JOBSAVED,
      page: ()=>JobSavedPage(),
      binding: JobSavedBinding(),
    ),
    GetPage(
      name: AppRoutes.APPLYJOB,
      page: ()=>ApplyJobPage(),
      binding: ApplyJobBinding(),
    ),
    
    //Agent
    GetPage(
      name: AppRoutes.EDIT_COMPANY_INFOR,
      page: ()=>EditCompanyPage(),
      binding: EditCompanyBinding(),
    ),

    GetPage(
      name: AppRoutes.ADD_JOB,
      page: ()=>AddJobView(),
      binding: AddJobBinding(),
    ),

    GetPage(
      name: AppRoutes.CVMANAGE, 
      page: ()=>CVManage(),
      binding: CVManageBinding(),
    ),

    GetPage(
      name: AppRoutes.CVPROFILE,
      page: ()=>TopCVProfilePage(),
      binding: TopCVProfileBindings()      
    )
  ];
}