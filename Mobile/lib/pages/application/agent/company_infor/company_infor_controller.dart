import 'dart:convert';

import 'package:get/get.dart';
import 'package:jobpilot_app/common/item_object/item_job_detail.dart';
import 'package:jobpilot_app/pages/application/application_controller.dart';


import 'package:http/http.dart' as http;

import '../../../../common/api/api_backend.dart';
import '../../../../common/company.dart';
import '../../../../common/routes/names.dart';


class CompanyInforController extends GetxController {
  List<Company> companies = <Company>[].obs ;
  List<ItemJobDetail> jobs = <ItemJobDetail>[].obs ;
  @override
  onInit(){
    super.onInit();
    getCompany();
    getJobs();
  }

  Future<void> getCompany() async {
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.companyApi.GET_COMPANY_INFOR+ApplicationController.company_id);
      final response = await http.get(url,headers: headers);
      await Future.delayed(const Duration(seconds: 1));
      if(response.statusCode == 200) {
        Company company = Company.fromJson(jsonDecode(response.body));
        companies.clear();
        companies.add(company);
      } else if(response.statusCode == 404) {
        print('404 not found');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getJobs() async {
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.jobApi.GET_LIST_JOBS+ApplicationController.company_id);
      final response = await http.get(url,headers: headers);
      await Future.delayed(const Duration(seconds: 1));
      if(response.statusCode == 200) {
        jobs.addAll((jsonDecode(response.body) as List).map((e) => ItemJobDetail.fromJson(e)).toList());
      } else if(response.statusCode == 404) {
        print('404 not found');
      }
    } catch (e) {
      print(e);
    }
  }
  
  void HandleEditPage() {

    Get.toNamed(AppRoutes.EDIT_COMPANY_INFOR);
 }
}