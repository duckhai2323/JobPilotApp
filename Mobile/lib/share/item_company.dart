import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../common/colors/colors.dart';
import '../pages/companies/companies_controller.dart';

class CompanyCard extends GetView<CompaniesController>{
  final String logo;
  final String name;
  final String description;
  final String scale;

  const CompanyCard({
    Key? key,
    required this.logo,
    required this.name,
    required this.description,
    required this.scale,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      height: 130,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 1,
              color: Colors.grey.shade300
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 0.25,
                        blurRadius: 2,
                        offset: Offset(0,2),
                      )
                    ]
                ),
                child: Image.network(logo)
            ),
            const SizedBox(width: 20),
            // Texts
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 70, // Giới hạn chiều cao của name
                    ),
                    child: Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Description
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 70, // Giới hạn chiều cao của description
                    ),
                    child: Text(
                      description,
                      style: const TextStyle(fontSize: 14,color: AppColors.placeHolderColor),
                    ),
                  ),

                  SizedBox(height: 3,),
                  Text(
                    scale,
                    style: const TextStyle(fontSize: 14,color: AppColors.placeHolderColor),
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