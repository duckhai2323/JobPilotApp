import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/colors/colors.dart';

Widget AgentWatchItem(BuildContext context, logo, agent, company, duration) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.only(bottom: 10,left: 15,right: 15),
    padding: const EdgeInsets.only(bottom: 25,top: 15,left: 15,right: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 0.25,
          blurRadius: 2,
          offset: Offset(0,2),
        )
      ]
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.placeHolderColor, width: 1),
            ),
            child: Image.asset(
              logo,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  agent,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  company,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Text(
            duration,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.placeHolderColor,
            )
          ),
        ]
      )
    )
  );
}