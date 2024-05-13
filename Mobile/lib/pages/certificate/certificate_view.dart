import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/pages/certificate/certificate_controller.dart';

class CertificatePage extends GetView<CertificateController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Thêm chứng chỉ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tên chứng chỉ *',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Nhập tên chứng chỉ',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5), 
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Tên tổ chức',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Nhập tên tổ chức',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5), 
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Thời gian *',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Ngày xác thực',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5), 
                      suffixIcon: GestureDetector(
                      onTap: () {
                  // Hành động khi nút ngày xác thực được nhấn
                },
                child: Icon(Icons.date_range),
              ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Ngày hết hạn',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10), 
                        suffixIcon: GestureDetector(
                        onTap: () {
                   // Hành động khi nút ngày xác thực được nhấn
                         },
                   child: Icon(Icons.date_range),
              ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
                Padding(
                     padding: const EdgeInsets.symmetric(vertical: 8.0),
                     child: CheckboxListTile(
                         title: Text(
                             'Chứng chỉ không có ngày hết hạn',
                         style: TextStyle(fontSize: 14),
                         maxLines: 1,
                           ),
                         contentPadding: EdgeInsets.all(0),
                         controlAffinity: ListTileControlAffinity.leading,
                         value: false,
                         onChanged: (value) {
                             // Xử lý sự kiện khi ô vuông được chọn
                             controller.updateNoExpirationDate(!controller.noExpirationDate.value);
                      },
                     ),
                   ),
              SizedBox(width: 5),
              Text(
                'Thêm ảnh',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Container(
                 width: double.infinity, // Đảm bảo rằng chiều rộng của Container bằng chiều rộng của màn hình
                 decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(8), // Bo góc của Container
                 color: Colors.grey.withOpacity(0.2), // Màu nền cho hình chữ nhật
                  
             ),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Xử lý sự kiện khi nút "Chọn ảnh" được nhấn
                  
                },
                icon: Icon(Icons.add_a_photo),
                label: Text("Chọn ảnh"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), backgroundColor: Colors.transparent, // Bo góc của nút
                  //backgroundColor: Color.black,
                  elevation: 0, // Loại bỏ màu nền của nút
                  padding: EdgeInsets.symmetric(vertical: 12), // Khoảng cách giữa icon và label
                ),
              ),
            ),
              SizedBox(height: 16),
              Text(
                'Thêm link',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
                 Container(
                     decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(8),
                     color: Colors.grey.withOpacity(0.2),
                    ),
                   child: Stack(
                     alignment: Alignment.centerRight,
                     children: [
                       
                         TextFormField(
                         decoration: InputDecoration(
                         hintText: 'Nhập link',
                         border: InputBorder.none, // Loại bỏ viền của TextFormField
                         contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        ),
                       ),
                    
                    Padding(
                        padding: const EdgeInsets.only(right: 4), // Khoảng cách giữa nút và TextFormField
                        child: Container(
                             width:  70,
                             height: 30, 
                             decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                                  color: Colors.grey.withOpacity(0.2), // Màu nền của nút "Thêm"
                           ),
                     child: TextButton(
                         onPressed: () {
                           // Xử lý sự kiện khi nút "Thêm" được nhấn
                      },
                        child: Text(
                            'Thêm',
                           style: TextStyle(color: Colors.black), // Màu chữ của nút "Thêm"
                          ),
                      ),
                   ),
                  ),
                ],
              ),
             ),
              SizedBox(height: 70),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Xử lý sự kiện khi nút "Thêm mới" được nhấn
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
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