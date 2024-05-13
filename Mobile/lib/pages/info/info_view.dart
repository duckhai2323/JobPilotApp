import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/pages/info/info_controller.dart';

class InfoPage extends GetView<InfoController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        centerTitle: true, 
          title: Text('Cập nhập thông tin cá nhân',
          style: TextStyle(fontWeight: FontWeight.bold,
          fontSize: 18),
          ),
          leading: IconButton( // Thêm nút back
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
         body: Padding( 
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ngày sinh',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 1.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                        hintText: 'Ngày sinh của bạn',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5), 
                         suffixIcon: IconButton(
                              icon: Icon(Icons.date_range),
                              onPressed: () {
                                 // Xử lý khi nhấn vào icon date
                               },
                            ),
                          ),
                       ),
                    )
                  )
                ]
              ),
              SizedBox(height: 16),
              Text(
                 'Giới tính *',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
               Row(
             children: [
                 Checkbox(
                     value: controller.gender == 'Nam',
                     onChanged: (value) {
                     controller.updateGender(value ?? false ?'Nam' : '');
                     },
                     shape: CircleBorder(),
                ),
             Text('Nam'),
             SizedBox(width: 80),
             Checkbox(
                 value: controller.gender == 'Nữ',
                 onChanged: (value) {
                 controller.updateGender(value ?? false ? 'Nữ' : '');
                },
                shape: CircleBorder(),
             ),
            Text('Nữ'),
           ],
         ),
         SizedBox(height: 0),
              Text(
                'Email *',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Nhập email',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5), 
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Số điện thoại *',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'VD: 09xxxxxxxxxx',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5), 
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Địa chỉ *',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Địa chỉ hiện tại của bạn',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5), 
                ),
              ),
              SizedBox(height: 30),
              Expanded( // Sử dụng Expanded để nút "Thêm mới" nằm ở dưới cùng và có chiều ngang gần bằng chiều ngang của giao diện
                child: SizedBox(
                  width: double.infinity,
                  height: 20,
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
                    child: Text('Cập nhật'),
                  ),
                ),
              ),
             ]
           )
         )
      ),
    );
  }
}