import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/colors/colors.dart';

Widget JobMainItem (
    BuildContext context,
    company_image,
    company_name,
    job_title,
    job_location,
    experience_require,
    salary
    ) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.only(bottom: 10,left: 15,right: 15),
    padding: const EdgeInsets.only(bottom: 10,top: 15,left: 15,right: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
      border: Border.all(
        color: AppColors.primaryColor1,
        width: 1,
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 70,
              height: 70,
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
                  ],
                image: DecorationImage(
                  image: NetworkImage(company_image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 10),
              width: MediaQuery.of(context).size.width - 175,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job_title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor2
                    ),
                  ),

                  //SizedBox(height: 5,),

                  Text(
                    company_name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor2
                    ),
                  ),

                  SizedBox(height: 5,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4,horizontal: 5),
                        decoration: BoxDecoration(
                          color: AppColors.bgSearch,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            job_location,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryColor2
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10,),

                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 5),
                        decoration: BoxDecoration(
                          color: AppColors.bgSearch,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            experience_require,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryColor2
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8,),

                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 5),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(243, 249, 245, 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                             salary,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor1
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.bookmark_outline_rounded, color: AppColors.placeHolderColor,size: 30,),
          ],
        ),
        const Divider(color: AppColors.bgTextFeild,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.access_time_filled,size: 20,color: AppColors.placeHolderColor,),
            const SizedBox(width: 5,),
            RichText(
              text: const TextSpan(
                text: 'Còn ',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.placeHolderColor,
                  fontWeight: FontWeight.w500,
                ),
                children: <TextSpan>[
                  TextSpan(text: '29 ', style: TextStyle(color: AppColors.primaryColor2,)),
                  TextSpan(text: 'ngày để ứng tuyển'),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}