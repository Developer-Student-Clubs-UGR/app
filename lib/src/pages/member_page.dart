import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dsc_app/src/utils/utils.dart';
import 'package:dsc_app/src/utils/members.dart';

class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  
  bool isLoad = false;

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
                _createMembers(context),
              ],
            ),
          )
        ],
      )
    );

  }

  Widget _boxText1(){ 

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
              firstText('Nuestro equipo','¡Conócelo!'),
              SizedBox(height: 20),
            ], 
          )
        ),
      ),
     );

  }

  Widget _createMembers(BuildContext context){

    List<Widget> members = new List();

    return StreamBuilder(
      stream: Firestore.instance.collection('miembros').orderBy('orden').snapshots(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          for(int i = 0; i<snapshot.data.documents.length; i++){
            members.add(_createMembersCard(snapshot.data.documents[i]));
          }
          return _members(members);
        }else{
          return SafeArea(child: Center(child: CircularProgressIndicator()));
        }
      }
    );

  }

  Widget _members(List<Widget> members){

    return Column(
      children: members,
    );

  }

  Widget _createMembersCard(DocumentSnapshot document){

    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            nameMember(document['nombre']),
            postMember(document['cargo']),
            SizedBox(height: 10),
            imageMember(document['img']),
            SizedBox(height: 10),
            areaMember(document['area']),
            SizedBox(height: 10),
            showNetworks(document),
          ],
        )
      )
    );

  }

}