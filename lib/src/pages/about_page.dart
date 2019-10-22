import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:dscUGR/src/utils/utils.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
                _boxText2(),
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
              firstText('Developer Student Clubs','Universidad de Granada'),
              _paragraphAbout(),
            ], 
          )
        ),
      ),
     );

  }

  Widget _paragraphAbout(){

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
      child: Text(
        'Los Developer Student Clubs (DSC) son comunidades de estudiantes universitarios, con el objetivo de conciliar la teoría y la práctica creando proyectos útiles para las comunidades locales y organizando talleres para difundir tecnologías.\n\nUniéndose a un DSC, los estudiantes ganan conocimientos en un entorno de aprendizaje uno-a-uno, y construyen soluciones para negocios locales y su comunidad.\n\nCualquier estudiante de grado o posgrado con interés de crecer como desarrollador es bienvenido al equipo.',
        textAlign: TextAlign.justify, style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400, fontFamily: "Google"),
      ),
    );

  }

  Widget _boxText2(){

    return Container(
      margin: EdgeInsets.all(10.0),
      width: double.infinity,
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            _secondText('Contacto', 'Siguenos'),
            SizedBox(height: 20),
            _row1(),
            SizedBox(height: 30),
            _row2(),
            SizedBox(height: 20),
          ],
        )
      )
    );

  }

  Widget _secondText(String title, String subtitle){

    return Container(
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
    );

  }

  Widget _row1(){

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _contact(Icons.web,'Web','https://dscgranada.com'),
          _contact(const IconData(0xf099, fontFamily: 'iconos'),'Twitter','https://twitter.com/DSC_Granada'),
          _contact(const IconData(0xf300, fontFamily: 'iconos'),'GitHub','https://github.com/Developer-Student-Clubs-UGR'),
        ],
      );

    }

  Widget _row2(){

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[          
        SizedBox(width: 5),
        _contact(Icons.chat, 'Telegram', 'https://t.me/DSCGranada'),
        _contact(Icons.email ,'Correo','contacto@dscgranada.com', true),
        SizedBox(width: 30),
       ],
    );

  }

  Widget _contact(IconData icono, String info, String info2, [bool email=false]){

    return Column(
        children: <Widget>[
          SizedBox(width: 10),
          InkWell(
            child: _social(icono, info),
            onTap: () => _launchURL('$info2', email),
          ),
        ],
    );

  }

  Widget _social(IconData icono, String info){
    return Column(
      children: <Widget>[
        Icon(icono, size: 30),
        SizedBox(height: 5),
        Text('$info', style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w500, fontFamily: "Google"))
      ],
    );
  }

  void _launchURL(String url, [bool email=false]) async{

    if(email){
      String uri = "mailto:$url?subject=ASUNTO&body=CUERPO";
      print(uri);
      if(await canLaunch(uri)){
        await launch(uri);
      }
    }

    if(await canLaunch(url)){
      await launch(url);
    }

  }


}