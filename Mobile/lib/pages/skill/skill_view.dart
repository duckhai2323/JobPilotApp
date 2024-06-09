import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/pages/skill/skill_controller.dart';

class SkillPage extends GetView<SkillController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        centerTitle: true, // Đặt centerTitle thành true để căn giữa title
          title: Text('Thêm kỹ năng',
          style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton( // Thêm nút back
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text('Tên kỹ năng',
               style: TextStyle(fontWeight: FontWeight.bold,
                                 fontSize: 17,
               ),
               
               ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Nhập tên kỹ năng',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
               Text('Mức độ kỹ năng',
               style: TextStyle(fontWeight: FontWeight.bold,
               fontSize: 17,),
               ),
              Container(
                child: Row(
                     
                    children: List.generate(
                         5,
                      (index) => Padding(
                       padding: EdgeInsets.symmetric(horizontal: 10), // Khoảng cách giữa các ngôi sao
                       child: Icon(
                            Icons.star,
                            color: Colors.grey.withOpacity(0.2),
                        ),
                      ),
                   ).toList(),
                ),
              ),
               Text('Mô tả chi tiết',
               style: TextStyle(fontWeight: FontWeight.bold,
               fontSize: 17,),
               ),
              Container(
                padding: EdgeInsets.all(8),
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Nhập mô tả chi tiết',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Expanded( // Sử dụng Expanded để nút "Thêm mới" nằm ở dưới cùng và có chiều ngang gần bằng chiều ngang của giao diện
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Xử lý sự kiện khi nút được nhấn
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder( // Thiết lập hình dạng của nút thành chữ nhật
                      borderRadius: BorderRadius.circular(8),
                     ),
                    ),
                    child: Text('Thêm mới'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}