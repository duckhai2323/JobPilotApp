import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/companies/companies_controller.dart';

import '../../common/colors/colors.dart';
import '../../share/item_company.dart';

class CompaniesPage extends GetView<CompaniesController> {

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Top Công ty hàng đầu',
            style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(()=>ListView.builder(
          itemCount: controller.listCompanies.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, index) {
            return CompanyCard(
              logo: controller.listCompanies[index].company_image??"",
              name: controller.listCompanies[index].company_name,
              description: controller.listCompanies[index].company_filed,
              scale: controller.listCompanies[index].employee_scale,
            );
          },
        ),),
      ),
    );
  }
}

