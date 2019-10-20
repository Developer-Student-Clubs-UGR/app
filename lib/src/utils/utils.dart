import 'package:flutter/material.dart';

final styleTitle = TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700, fontFamily: "Google");
final styleSubTitle = TextStyle(fontSize: 23.0, color: Colors.grey, fontWeight: FontWeight.w500, fontFamily: "Google");

Widget backgroundColor(){ // Background color for all pages.
  return Container(
    width: double.infinity,
    height: double.infinity,
    color: Color.fromRGBO(241, 243, 244, 1.0),
  );
}

Widget firstText(String title, String subtitle){

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('$title', style: styleTitle),
                  SizedBox(height: 7.0),
                  Text('$subtitle', style: styleSubTitle),
                ],
              ),
            )
          ],
        )
      )
    );

  }

    