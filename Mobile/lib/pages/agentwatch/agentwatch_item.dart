import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/colors/colors.dart';

Widget AgentWatchItem(BuildContext context, logo, agent, company, duration) {
  return Container(
    margin: const EdgeInsets.only(top: 15),
    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
    height: 130,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            width: 1,
            color: Colors.grey.shade300
        )
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.25,
                      blurRadius: 2,
                      offset: Offset(0,2),
                    )
                  ]
              ),
              child: Image.network(logo)
          ),
          const SizedBox(width: 20),
          // Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 70, // Giới hạn chiều cao của name
                      ),
                      child: Text(
                        agent,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    Text(
                      duration,
                      style: const TextStyle(fontSize: 14,color: AppColors.placeHolderColor),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                // Description
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 70, // Giới hạn chiều cao của description
                  ),
                  child: Text(
                    company,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}