import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'receive_page.dart';
import 'send_page.dart';

class Home extends StatefulWidget {
  final String title;

  const Home({Key? key, required this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home>{
  int _selectedIndex = 0;

  void _onItemTapped(int index){
      setState(() {
          _selectedIndex = index;
      });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    ReceivingPage(),
    SendingPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
                 style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          Center(child:Text('Login'.tr)),
          PopupMenuButton(
            padding: EdgeInsets.fromLTRB(20, 0, 30, 0),
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) =>[])
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex)
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.file_download),
            label: 'Receive'.tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_upload),
            label: 'Send'.tr,
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex ,
      ),
    );
  }
}
