import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/companies/companies_controller.dart';

import '../../common/colors/colors.dart';

class CompaniesPage extends GetView<CompaniesController> {

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text(
          'Top Công ty hàng đầu',
            style: TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.bold, 
            color: Colors.green, 
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            CompanyCard(
              logo: 'assets/images/logo_fpt.png',
              name: 'FPT Sofware',
              description: 'Tài chính',
            ),
             CompanyCard(
              logo: 'assets/images/ghtk.png',
              name: 'Giao Hàng Tiết Kiệm',
              description: 'Logistics - Vận tải',
            ),
            CompanyCard(
              logo: 'assets/images/sun.png',
              name: 'Sun Aterisk',
              description: 'Viễn thông',
            ),
            CompanyCard(
              logo: 'assets/images/viettel.png',
              name: 'Viettel',
              description: 'Viễn thông - Công nghệ',
            ),
            CompanyCard(
              logo: 'assets/images/vng.png',
              name: 'VNG',
              description: 'Phần mềm',
            ),
            CompanyCard(
              logo: 'assets/images/vtbank.png',
              name: 'VietinBank',
              description: 'Ngân hàng',
            ),
            // Add more CompanyCards for other companies
          ],
        ),
      ),
    );
  }

  }
  class CompanyCard extends GetView<CompaniesController>{
  final String logo;
  final String name;
  final String description;

  const CompanyCard({
    Key? key,
    required this.logo,
    required this.name,
    required this.description,
  }) : super(key: key);
   @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo
            Container( 
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), // Độ cong viền
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1), // Màu của bóng
                    spreadRadius: 2, // Bán kính lan truyền của bóng
                    blurRadius: 5, // Độ mờ của bóng
                    offset: Offset(0, 3), // Độ tịnh tiến của bóng
                  ),
                ],
              ),
            child: Image.asset(
              logo,
              fit: BoxFit.contain,
            ),
            ),
            SizedBox(width: 10),
            // Texts
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 70, // Giới hạn chiều cao của name
                    ),
                  child: Text(
                    name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                   ),
                  ),
                  SizedBox(height: 5),
                  // Description
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 70, // Giới hạn chiều cao của description
                    ),
                  child: Text(
                    description,
                    style: TextStyle(fontSize: 16),
                   ),
                 ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  }