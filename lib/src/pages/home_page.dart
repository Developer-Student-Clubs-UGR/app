import 'package:flutter/material.dart';

import 'dart:math';

import 'package:dsc_app/src/utils/utils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: <Widget>[
          backgroundColor(),
          _shapes(),
          _logo(),
          _arrow(),
        ],
      ),
    );

  }
}

Widget _shapes(){

    final greenBox = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Color.fromRGBO(52, 168, 83, 1.0)
        ),
      )
    );

    final blueBox = Transform.rotate(
      angle: -pi / 3.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150.0),
          //color: Color.fromRGBO(66, 133, 244, 1.0)
          color: Color.fromRGBO(251, 188, 5, 1.0)
        ),
      )
    );

    final redBox = Transform.rotate(
      angle: -pi / 3.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          //color: Color.fromRGBO(234, 67, 53, 1.0)
          color: Color.fromRGBO(66, 133, 244, 1.0)
        ),
      )
    );

    final yellowBox = Transform.rotate(
      angle: -pi / 3.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200.0),
          //color: Color.fromRGBO(251, 188, 5, 1.0)
          color: Color.fromRGBO(234, 67, 53, 1.0)
        ),
      )
    );

    return Stack(
      children: <Widget>[
        Positioned(
          child: greenBox,
          top: -125,
          left: 275,
        ),
        Positioned(
          child: blueBox,
          top: 425,
          left: 300,
        ),
        Positioned(
          child: redBox,
          top: 400,
          right: 300,
        ),
        Positioned(
          child: yellowBox,
          top: -50,
          right: 300,
        )
      ],
    );

  }

Widget _logo(){

    return Container(
      child: Positioned(
        child: Image(
          semanticLabel: "Logotipo del Developer Student Clubs de la Universidad de Granada",
          width: 500,
          height: 700,
          image: AssetImage('assets/img/DSC_UniversityOfGranada.png'),
        ),
      )
    );

  }

Widget _arrow(){
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down, size: 100.0, color: Colors.black45),
        ],
      ),
    );
  }

  