import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNAV extends StatefulWidget {
  const BottomNAV({Key? key}) : super(key: key);

  @override
  State<BottomNAV> createState() => _BottomNAVState();
}

class _BottomNAVState extends State<BottomNAV> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: CurvedNavigationBar(
       backgroundColor: Colors.blue,
        color: Colors.white,
        items: <Widget>[
          Icon(Icons.add, size: 30,),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      body: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(),
        body: Column(
          children: [

          ],
        ),

      )
    );
  }
}
