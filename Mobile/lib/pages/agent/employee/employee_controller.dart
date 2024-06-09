import 'dart:convert';

import 'package:get/get.dart';
import 'package:jobpilot_app/common/agent.dart';
import 'package:jobpilot_app/common/routes/names.dart';
import 'package:http/http.dart' as http;
import 'package:jobpilot_app/pages/application/application_controller.dart';

import '../../../common/api/api_backend.dart';

class EmployeeController extends GetxController {
  List<Agent> employees = <Agent>[].obs;
  @override
  onInit(){
    super.onInit();
    getListAgents();
  }
  Future<void> getListAgents() async {
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.agentApi.GET_EMPLOYEES+ApplicationController.company_id);
      final response = await http.get(url,headers: headers);
      if(response.statusCode == 200) {
        employees.clear();
        employees.addAll((jsonDecode(response.body) as List).map((e) => Agent.fromJson(e)).toList());
        employees.removeWhere((element) => element.agent_id.toString() == ApplicationController.user_id.toString());
        return;
      } else if(response.statusCode == 404) {
        print('404 not found');
      }
    } catch (e) {
      print(e);
    }
  }

  void handleAddEmployee() {
    Get.toNamed(AppRoutes.ADD_EMPLOYEE);
  }
}