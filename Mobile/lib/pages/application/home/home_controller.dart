import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jobpilot_app/common/routes/names.dart';

import '../../../common/api/api_backend.dart';
import '../../../common/company.dart';

class HomeController extends GetxController {
  PageController pageController = PageController(initialPage: 0);
  List<Company> listCompanies = <Company>[].obs;

  @override
  onInit(){
    super.onInit();
    getListCompanies();
  }
  Future<void> getListCompanies() async {
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.companyApi.GET_LIST_COMPANIES);
      final response = await http.get(url,headers: headers);
      if(response.statusCode == 200) {
        listCompanies.addAll((jsonDecode(response.body) as List).map((e) => Company.fromJson(e)).toList());
        // print(response.body);
        return;
      } else if(response.statusCode == 404) {
        print('404 not found');
      }
    } catch (e) {
      print(e);
    }
  }
  final statePageView = 0.obs;
  void ChangePageView (int page) {
    statePageView.value = page;
  }
  void HandleNotifiPage () {
    Get.toNamed(AppRoutes.NOTIFICATION);
  }

  void HandleJobdetails () {
    Get.toNamed(AppRoutes.JOBDETAILS);
  }

  void HandleCompaniesPage () {
    Get.toNamed(AppRoutes.COMPANIES);
  }
}