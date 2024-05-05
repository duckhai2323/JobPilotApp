import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobpilot_app/common/colors/colors.dart';

Widget UploadOrCreateCV(BuildContext context, String message, String subMessage, String btnText, double btnWidth, double btnHeight, void Function() onPressed) {
  return Container(
    padding: EdgeInsets.all(20),
    width: MediaQuery.of(context).size.width,
    height: 250,
    decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 218, 216, 216)),
        borderRadius: BorderRadius.all(Radius.circular(5))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/doc.png',
          width: 80,
          height: 80,
        ),
        Text(
          message,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        Text(
          subMessage,
          style: TextStyle(color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(btnWidth, btnHeight),
              elevation: 2,
              backgroundColor: AppColors.primaryColor1,
              foregroundColor: Colors.white,
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  size: 20,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(btnText)
              ],
            ))
      ],
    ),
  );
}
