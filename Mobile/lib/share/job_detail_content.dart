import 'package:flutter/cupertino.dart';
import 'package:jobpilot_app/common/colors/colors.dart';

Widget JobDetailContent (String title, String content, BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 15,top: 15),
        child: Text(
         title,
          style: const TextStyle(
            fontFamily: "Roboto",
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      SizedBox(height: 10,),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        child: Text(
         content,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.placeHolderColor,
          ),
          maxLines: 10,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}