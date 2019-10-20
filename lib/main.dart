import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:dsc_app/src/pages/dsc_page.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([ // We don't allow the APP to be different when turning the phone, it'll be as is.
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light.copyWith( // The top bar will be transparent.
      statusBarColor: Colors.transparent  
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DSC UGR',
      initialRoute: 'dsc',
      routes: {
        'dsc': (BuildContext context) => DSCPage(),
      }
    );
  }
}