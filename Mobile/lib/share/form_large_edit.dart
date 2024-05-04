import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/colors/colors.dart';

Widget FormLargeEdit (String title, String subTitle) {
  return Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),

      const SizedBox(height: 5,),

      TextFormField(
        obscureText: false,
        keyboardType: TextInputType.emailAddress,
        maxLines: 5,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: AppColors.primaryColor2
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          filled: true,
          fillColor: Colors.white,
          hintText: subTitle,
          hintStyle: const TextStyle(color: AppColors.placeHolderColor,fontSize: 16,fontFamily: "Roboto Regular", fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                  color: Colors.grey.shade400,
                  width: 1
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide:  BorderSide(
                  color: Colors.grey.shade400,
                  width: 1
              )
          ),

          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide:  BorderSide(
                  color: Colors.grey.shade400,
                  width: 1
              )
          ),
        ),
      ),
    ],
  );
}