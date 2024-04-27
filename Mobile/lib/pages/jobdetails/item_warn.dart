import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/jobdetails/jobdetails_controller.dart';

class ItemWarn extends GetView<JobDetailsController> {
  String image;
  String text;
  ItemWarn(this.image,this.text, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(image),
          width: 160,
          height: 160,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 30,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}