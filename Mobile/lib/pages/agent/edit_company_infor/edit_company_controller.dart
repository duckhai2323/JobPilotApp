import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/api/api_backend.dart';
import '../../../common/colors/colors.dart';
import '../../../common/company.dart';
import 'package:http/http.dart' as http;

import '../../application/agent/company_infor/company_infor_controller.dart';
import '../../application/application_controller.dart';

class EditCompanyController extends GetxController {
  var textController1 = TextEditingController();
  var textController2 = TextEditingController();
  var textController3 = TextEditingController();
  var textController4 = TextEditingController();
  var textController5 = TextEditingController();
  var textController6 = TextEditingController();
  var textController7 = TextEditingController();
  var textController8 = TextEditingController();
  final companyInforController = Get.find<CompanyInforController>();

  List<Company> list_companies = <Company>[].obs;

  @override
  onInit(){
    super.onInit();
    getCompanyCurrent();
  }

  Future<void> getCompanyCurrent() async {
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.companyApi.GET_COMPANY_INFOR+ApplicationController.company_id);
      final response = await http.get(url,headers: headers);
      if(response.statusCode == 200) {
        Company company = Company.fromJson(jsonDecode(response.body));
        list_companies.add( Company.fromJson(jsonDecode(response.body)));
        textController1.text = company.company_name;
        textController2.text = company.company_link;
        textController3.text = company.employee_scale;
        textController4.text = company.company_location;
        textController5.text = company.email;
        textController6.text = company.company_organize;
        textController7.text = company.company_filed;
        textController8.text = company.company_intro;

      } else if(response.statusCode == 404) {
        print('404 not found');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateCompany(BuildContext context) async {
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.companyApi.GET_COMPANY_INFOR+ApplicationController.company_id);
      Company companyUpdate = Company(textController1.text.toString(), textController5.text.toString(), textController3.text.toString(), textController8.text.toString(), textController2.text.toString(), textController4.text.toString(), textController7.text.toString(), textController6.text.toString());
      showLoaderDialog(context);
      final response = await http.put(url,body: jsonEncode(companyUpdate.toJson()),headers: headers);
      if(response.statusCode == 200) {
        companyInforController.getCompany();
        await Future.delayed(const Duration(seconds: 1));
        Navigator.pop(context);
        Get.back();
      } else {
        print('404 not found');
      }
    } catch (e) {
      print(e);
    }
  }

  void showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(margin: const EdgeInsets.only(left: 15),child:Text("Loading...", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16, color: AppColors.primaryColor1), )),
        ],),
    );
    showDialog(barrierDismissible: true,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  void reset() {
    textController1.text = list_companies[0].company_name;
    textController2.text = list_companies[0].company_link;
    textController3.text = list_companies[0].employee_scale;
    textController4.text = list_companies[0].company_location;
    textController5.text = list_companies[0].email;
    textController6.text = list_companies[0].company_organize;
    textController7.text = list_companies[0].company_filed;
    textController8.text = list_companies[0].company_intro;
  }

}