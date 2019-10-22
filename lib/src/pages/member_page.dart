import 'dart:async';

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dscUGR/src/utils/utils.dart';
import 'package:dscUGR/src/utils/members.dart';
import 'package:dscUGR/src/models/member_models.dart';

class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  
  bool isLoad = false;
  final databaseReference = Firestore.instance;
  List<Widget> members = new List();
  List<bool> showNetworksBool = new List();
  List<double> showNetworksDouble = new List();
  bool _conditionTap = true;

  void _changeShowNetworks(int index)async{

    if(showNetworksBool[index] == true){
      
      setState(() {
        _conditionTap = false;
        showNetworksBool[index] = !showNetworksBool[index];
      });

      await new Future.delayed(const Duration(milliseconds: 500));
      
      setState((){
        _conditionTap = true;
        _changeHeight(index);
      });

    }else{

      setState(() {
        _conditionTap = false;
      _changeHeight(index);
      });

      await new Future.delayed(const Duration(milliseconds: 500));

      setState((){
        _conditionTap = true;
        showNetworksBool[index] = !showNetworksBool[index];
      });

    }

  }

  Future<void> _changeHeight(index){

    if(showNetworksDouble[index] == 0){
        showNetworksDouble[index] = 80;
    }else{
        showNetworksDouble[index] = 0;
    }

  }

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

    return StreamBuilder(
      stream: Firestore.instance.collection('miembros').orderBy('orden', descending: false).snapshots(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          members.clear();
          for(int i = 0; i<snapshot.data.documents.length; i++){
            showNetworksBool.add(false);
            showNetworksDouble.add(0);
            members.add(_createMembersCard(snapshot.data.documents[i],i));
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

  Widget _createMembersCard(DocumentSnapshot document, int index){

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
            rankMember(document['cargo']),
            SizedBox(height: 10),
            imageMember(document['img']),
            SizedBox(height: 10),
            areaMember(document['area']),
            SizedBox(height: 10),
            Visibility(
              visible: !showNetworksBool[index],
              child: SizedBox(
                height: 25,
                width: 25,
                child: GestureDetector(
                  onTap: _conditionTap ? () => _changeShowNetworks(index) : null,
                  child: FloatingActionButton(
                    child: Icon(Icons.arrow_drop_down),
                    backgroundColor: Color.fromRGBO(104, 105, 107, 1.0),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: showNetworksBool[index],
              child: SizedBox(
                height: 25,
                width: 25,
                child: GestureDetector(
                  onTap: _conditionTap ? () => _changeShowNetworks(index) : null,
                  child: FloatingActionButton(
                    child: Icon(Icons.arrow_drop_up),
                    backgroundColor: Color.fromRGBO(104, 105, 107, 1.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: showNetworksDouble[index],
                child: AnimatedOpacity(
                    opacity: showNetworksBool[index] ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 300),
                    child: showNetworks(document)
                  ),
              ),
          ],
        )
      )
    );

  }

}