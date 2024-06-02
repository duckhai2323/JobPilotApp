import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/pages/jobsaved/item_job.dart';
import 'package:jobpilot_app/pages/jobsaved/jobsaved_controller.dart';
import 'package:jobpilot_app/share/jobmain_item.dart';

class JobSavedPage extends GetView<JobSavedController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back_sharp,color: AppColors.primaryColor1,),
        centerTitle: true,
        title: const Text(
          'Việc làm đã lưu',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor1
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    insetPadding: const EdgeInsets.only(left: 15,right: 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 160,
                      padding: const EdgeInsets.only(bottom: 10, top: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(width: 30),
                              const Text(
                                'Bỏ theo dõi tất cả việc làm',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              IconButton(
                                onPressed: () => Navigator.pop(context, "Huỷ"),
                                icon: Stack(
                                  children: <Widget>[
                                    Positioned.fill(
                                      child: Container(
                                        margin: const EdgeInsets.all(6),
                                        color: const Color.fromRGBO(192, 192, 192, 0.8)
                                      )
                                    ),
                                    const Icon(Icons.cancel, size: 30, color: AppColors.bgTextFeild, fill: 0.5)
                                  ]
                                )
                              )
                            ]
                          ),

                          const Text(
                            '    Bạn có chắc chắn muốn bỏ lưu tất cả việc làm?    ',
                             style: TextStyle(
                               fontSize: 15,
                               color: AppColors.placeHolderColor,
                               fontWeight: FontWeight.w500,
                             )
                          ),

                          const SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                  style: TextButton.styleFrom(
                                    fixedSize: const Size(165, 40),
                                    elevation: 2,
                                    backgroundColor: AppColors.bgTextFeild,
                                    foregroundColor: AppColors.primaryColor2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed: () => Navigator.pop(context, 'Huỷ'),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          "Huỷ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                      )
                                    ],
                                  )
                              ),
                              const SizedBox(width: 15),
                              TextButton(
                                  style: TextButton.styleFrom(
                                    fixedSize: const Size(165, 40),
                                    elevation: 2,
                                    backgroundColor: const Color.fromRGBO(255, 229, 204, 0.8),
                                    foregroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed: (){
                                    controller.deleteAllJob();
                                    Navigator.pop(context, 'Bỏ lưu');
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          "Bỏ lưu",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                      )
                                    ],
                                  )
                              ),
                            ],
                          )
                        ],
                      )
                    )
                  );
                }
              ),
              icon: Icon(Icons.bookmark_remove_outlined,color: AppColors.primaryColor1,)
          ),
        ],
      ),
      backgroundColor: AppColors.backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Obx(
                    ()=> RichText(
                        text: TextSpan(
                          text: controller.listJobs.length.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.primaryColor1,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: ' việc làm', style: TextStyle(color: AppColors.placeHolderColor,)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
          Obx(
            ()=> SliverList(
              delegate: SliverChildBuilderDelegate((_, int index) {
                return InkWell(
                  onTap: () {
                    controller.HandleJobDetails();
                  },
                  child: JobSaveItem(
                      context,
                      controller.listJobs[index].company_image??"",
                      controller.listJobs[index].company_name??"",
                      controller.listJobs[index].job_title??"",
                      controller.listJobs[index].job_location??"",
                      controller.listJobs[index].experience_require??"",
                      controller.listJobs[index].salary??"",
                      true,
                      index
                  )
                );
              },
              childCount: controller.listJobs.length,
              )
            ),
          )
        ]
      )

    );
  }
}