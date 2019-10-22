import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dscUGR/src/utils/utils.dart';
import 'package:dscUGR/src/utils/events.dart';

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
                _createEvent(context),
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

  Widget _createEvent(BuildContext context){

    List<Widget> events = new List();

    return StreamBuilder(
      stream: Firestore.instance.collection("eventos").where("estado",isEqualTo: true).snapshots(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          for(int i = 0; i<snapshot.data.documents.length; i++){
            events.add(_createEventsCard(snapshot.data.documents[i]));
          }
          return _events(events);
        }else{
          return SafeArea(child: Center(child: CircularProgressIndicator()));
        }
      }
    );

  }

  Widget _events(List<Widget> events){

    return Column(
      children: events,
    );

  }

  Widget _createEventsCard(DocumentSnapshot document){

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      width: double.infinity,
      child: GestureDetector(
        onTap: (){
          launchURL(document['url']);
        },
        child: Card(
          elevation: 3.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              titleEvent(document['titulo']),
              SizedBox(height: 10),
              infoEvent(document['fecha']),
              SizedBox(height: 10),
              infoEvent(document['lugar']),
              SizedBox(height: 10),
            ],
          )
        ),
      )
    );

  }

}