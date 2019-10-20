import 'package:flutter/material.dart';

import 'package:dsc_app/src/pages/member_page.dart';
import 'package:dsc_app/src/pages/event_page.dart';
import 'package:dsc_app/src/pages/about_page.dart';
import 'package:dsc_app/src/pages/home_page.dart';

class DSCPage extends StatefulWidget {
  @override
  _DSCPageState createState() => _DSCPageState();
}

class _DSCPageState extends State<DSCPage> {

  int _selectedIndex = 0;

  void _onItemTapped(int index){

    if(index == _selectedIndex){
      return;
    }else{
      setState(() {
      _selectedIndex = index;
    });
    }
    
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        pageSnapping: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          HomePage(),
          _homePage2(context),
        ],
      )
    );

  }

  Widget _homePage2(BuildContext context){

    List<Widget> _widgetOptions = <Widget>[
      AboutPage(),
      EventPage(),
      MemberPage(),
    ];

    return Scaffold(
      body: Center(
        child:  _widgetOptions.elementAt(_selectedIndex)
      ),
      bottomNavigationBar: _bottonNavigationBar(context),
    );

  } 

  Widget _bottonNavigationBar(BuildContext context){

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.white,
        primaryColor: Color.fromRGBO(104, 105, 107, 1.0),
        textTheme: Theme.of(context).textTheme.copyWith(
          caption: TextStyle(color: Color.fromRGBO(195, 197, 199, 1.0)),
        )
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30.0),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event, size: 30.0),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people, size: 30.0),
            title: Container(),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );

  }

}