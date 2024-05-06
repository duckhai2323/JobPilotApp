import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/attractivejob/attractivejob_controller.dart';
import 'package:jobpilot_app/pages/suitablejob/suitablejob_controller.dart';
import 'package:jobpilot_app/share/jobmain_item.dart';
import 'package:jobpilot_app/share/jobsub_item.dart';

import '../../common/colors/colors.dart';

class AttractiveJobPage extends GetView<AttractiveJobController> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text(
          'Việc làm hấp dẫn',
            style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Tìm kiếm...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                    ),
                    onChanged: (value) {
                      // Xử lý tìm kiếm ở đây
                    },
                  ),
                ),
                SizedBox(width: 10),
                Obx(() => DropdownButton<String>(
                      value: controller.selectedFilter.value,
                      onChanged: (String? newValue) {
                        controller.selectedFilter.value = newValue!;
                        // Xử lý khi người dùng thay đổi bộ lọc
                      },
                      items: <String>['Tất cả', 'Loại 1', 'Loại 2', 'Loại 3']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, index) {
                return JobSubItem(
                  "https://wsm.sun-asterisk.vn/assets/logo_framgia-58c446c37727ba4bc8317121c321edd3d4ed081787fac85cb08240dcef9dd062.png",
                  "Cty Phat Trien Phan Mem Sun Asterisk",
                  'Tuyen Lap Trinh Vien Fresher WEB MOBILE',
                  'Ha Noi',
                  '1 nam',
                  '300s',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}