import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/share/jobmain_item.dart';
import 'package:jobpilot_app/pages/jobdetails/jobdetails_controller.dart';

class RelatedJobs extends GetView<JobDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget> [
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return InkWell(onTap: () {},child: JobMainItem(
                  context,
                  "https://wsm.sun-asterisk.vn/assets/logo_framgia-58c446c37727ba4bc8317121c321edd3d4ed081787fac85cb08240dcef9dd062.png",
                  "Cty Phat Trien Phan Mem Sun Asterisk",
                  'Tuyen Lap Trinh Vien Fresher WEB MOBILE',
                  'Ha Noi',
                  '1 nam',
                  '300\u0024',
                  false
                ));
            },
            childCount: 3,
            ),
          )
        ],
      ),
    );
  }
}
