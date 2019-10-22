import 'package:flutter/material.dart';

Widget titleEvent(String title){
  return Text('$title', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, fontFamily: "Google"));
}

Widget infoEvent(String info){
  return Text('$info', style: TextStyle(fontSize: 17.0, color: Colors.grey, fontWeight: FontWeight.w500, fontFamily: "Google"));
}
