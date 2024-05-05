import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget MADECV(BuildContext context, String image, String time) {
  return Container(
    width: (MediaQuery.of(context).size.width - 16 - 16) / 2,
    height: 220,
    decoration: BoxDecoration(
        border: Border.all(
            style: BorderStyle.solid,
            color: Color.fromARGB(255, 218, 216, 216)),
        borderRadius: BorderRadius.all(Radius.circular(5))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(color: Color.fromARGB(255, 218, 216, 216))),
              color: Color.fromARGB(66, 215, 213, 213),
            ),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  child: 
                     image == "" ? 
                        Icon(
                          Icons.image,
                          size: 40,
                          color: Colors.grey,
                        ) : 
                        Image.asset(image)
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(
                    Icons.stars_rounded,
                    size: 25,
                    color: Colors.grey,
                  ),
                )
              ],
            )),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 68,
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "CV ứng tuyển",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Colors.grey,
                  )
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
