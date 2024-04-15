import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/pages/jobdetails/jobdetails_controller.dart';

class JobDetailsPage extends GetView<JobDetailsController> {

  @override
  Widget build(BuildContext context) {
    
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            backgroundColor: Colors.pink,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(  
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: screenHeight*1/2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.pink, AppColors.bgTextFeild], 
                ),
              ),
              child: Stack(
                children: [        
                    Positioned(
                      top: 40, 
                      left: 30,
                      right: 30,
                      child: Container(
                      height: screenHeight*2/5,
                      decoration: BoxDecoration( 
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10), // Độ cong của góc viền
                      ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          
                          children: [           
                            SizedBox(height: 60),
                            const Text(
                              'Fresher Developer FrontEnd',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryColor2
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'CÔNG TY CỔ PHẦN SUN ASTERISK',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryColor2
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.transparent,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color:Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 0.25,
                                    blurRadius: 2,
                                    offset: const Offset(0,2),
                                  )
                                ]
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(1),
                                            spreadRadius: 0.25,
                                            blurRadius: 2,
                                            offset: const Offset(0,2),
                                          )
                                        ]
                                      ),
                                      height: 120,
                                      child: const Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 5),
                                          Icon(Icons.money, size: 40, color: AppColors.primaryColor1,),
                                          SizedBox(height: 5),
                                          Text(
                                            "Mức Lương",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: AppColors.placeHolderColor
                                            ),
                                          )
                                        ],
                                      )
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(1),
                                            spreadRadius: 0.25,
                                            blurRadius: 2,
                                            offset: const Offset(0,2),
                                          )
                                        ]
                                      ),
                                      height: 120,
                                      child: const Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 5),
                                          Icon(Icons.location_on, size: 40, color: AppColors.primaryColor1,),
                                          SizedBox(height: 5),
                                          Text(
                                            "Mức Lương",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: AppColors.placeHolderColor
                                            ),
                                          )
                                        ],
                                      )
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(1),
                                            spreadRadius: 0.25,
                                            blurRadius: 2,
                                            offset: const Offset(0,2),
                                          )
                                        ]
                                      ),
                                      height: 120,
                                      child: const Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 5),
                                          Icon(Icons.star, size: 40, color: AppColors.primaryColor1,),
                                          SizedBox(height: 5),
                                          Text(
                                            "Mức Lương",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: AppColors.placeHolderColor
                                            ),
                                          )
                                        ],
                                      )
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                    ),
                  ),
                  Positioned(
                    top: 0, 
                    left: mediaQueryData.size.width/2 - 40,
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 0.25,
                            blurRadius: 2,
                            offset: const Offset(0,2),
                          )
                        ]
                      ),
                      child: Image.asset(
                        'assets/images/sun.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text(
                  "Thông tin chung",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor2  
                  ),
                  ),
                  
              ],
            ),
          )
        ],
      )
    );
  }
}