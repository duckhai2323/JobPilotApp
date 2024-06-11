import 'dart:convert';

import 'package:get/get.dart';
import 'package:jobpilot_app/common/routes/names.dart';
import 'package:jobpilot_app/common/university.dart';
import 'package:http/http.dart' as http;
import '../../../../common/api/api_backend.dart';
import '../../application_controller.dart';

class TopCVProfileController extends GetxController {
  List<University> universities = <University>[].obs;
  @override
  onInit(){
    super.onInit();
    getListUniversities();
  }
  Future<void> getListUniversities() async {
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.univerAPi.GET_LIST_UNIVER+ApplicationController.user_id);
      final response = await http.get(url,headers: headers);
      if(response.statusCode == 200) {
        universities.clear();
        universities.addAll((jsonDecode(response.body) as List).map((e) => University.fromJson(e)).toList());
        return;
      } else if(response.statusCode == 404) {
        print('404 not found');
      }
    } catch (e) {
      print(e);
    }
  }

  void HandleAddExperiencePage() {
    Get.toNamed(AppRoutes.ADDEXPERIENCE);
  }
  void HandleAddAcademicLeverPage() {
    Get.toNamed(AppRoutes.ADDACADEMICLEVER);
  }
   void HandleSkillPage () {
    Get.toNamed(AppRoutes.SKILL);
  }

   void HandleCertificatePage () {
    Get.toNamed(AppRoutes.CERTIFICATE);
  }

  void HandleInfoPage () {
    Get.toNamed(AppRoutes.INFO);
  }

  void HandleAddIntro () {
    Get.toNamed(AppRoutes.ADDINTRO);
  }
}
