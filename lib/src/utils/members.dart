import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Widget nameMember(String name){
  return Text('$name', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, fontFamily: "Google"));
}

Widget postMember(String post){
  return Text('$post', style: TextStyle(fontSize: 17.0, color: Colors.grey, fontWeight: FontWeight.w500, fontFamily: "Google"));
}

Widget imageMember(String img){

  if(img == ""){
    img = 'https://www.trzcacak.rs/myfile/full/385-3856300_no-avatar-png.png';
  }

  return ClipRRect(     
    borderRadius: BorderRadius.circular(50.0),
    child: FadeInImage(
      height: 100.0,
      width: 100.0,        
      image: NetworkImage('$img'),
      placeholder: AssetImage('assets/img/jar-loading.gif'),
    ),
  );
}

Widget areaMember(String area){
  return Text('$area', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500, fontFamily: "Google"));
}

Widget showNetworks(DocumentSnapshot document){

  return Column(
    children: <Widget>[
      SizedBox(height: 15.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _action('assets/img/twitter.png', 'Twitter', document['twitter']),
          _action('assets/img/github.png', 'GitHub', document['github']),
          _action('assets/img/linkedin.png', 'LinkedIn', document['linkedin']),
        ],
      ),
      SizedBox(height: 10.0),
    ],
  );

}

Widget _action(String icono, String texto, String url){

  return GestureDetector(
    onTap: () => _launchURL('$url'),
    child: Column(
    children: <Widget>[
      Image(image: AssetImage('$icono'), height: 25.0, width: 25.0),
      SizedBox(height: 5.0),
      Text('$texto', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, fontFamily: "Montserrat")),
      ],
    ),
  );

  }

void _launchURL(String url) async{

  if(await canLaunch(url)){
    await launch(url);
  }

}

