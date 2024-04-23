import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/pages/application/home/jobmain_item.dart';
import 'package:jobpilot_app/pages/jobdetails/jobdetails_controller.dart';

class RelatedJobs extends GetView<JobDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget> [
          SliverToBoxAdapter(
            child: SizedBox(height: 20), // Khoảng trống bên trên
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return InkWell(onTap: () {controller.HandleJobdetails();},child: JobMainItem());
            },
            childCount: 3,
            ),
          )
        ],
      ),
    );
  }
}
