import 'package:flutter/material.dart';

import 'package:dsc_app/src/utils/utils.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: <Widget>[
          backgroundColor(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _boxText1(),
              ],
            ),
          )
        ],
      ),
    );

  }

  Widget _boxText1(){ // Caja de texto para la introducción.

    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              firstText('Nuestros eventos','¡Ven y aprende!'),
              SizedBox(height: 20),
            ], 
          )
        ),
      ),
     );

  }

}