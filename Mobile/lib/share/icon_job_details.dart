import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/colors/colors.dart';

Widget IconJobDetails (Icon iconRequire, String title, String subTitle) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.bgIcon,
          child: iconRequire,
        ),
        const SizedBox(width: 15,),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle (
                fontSize: 12,
                color: AppColors.placeHolderColor,
              ),
            ),
            SizedBox(height: 3,),
            Text(
              subTitle,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500
              ),
            ),
          ],
        ),
      ],
    ),
  );
}