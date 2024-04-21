import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ChatLeftItem (String contentStr,String url){
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 300,
          minHeight: 40,
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 18,
              child: CircleAvatar(
                radius: 15,
                backgroundImage: CachedNetworkImageProvider("${url}"),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 60,top: 10),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(211, 211, 211, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                    bottomRight: Radius.circular(18)
                ),
              ),
              child: Text(
                contentStr??"",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}