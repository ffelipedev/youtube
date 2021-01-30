import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          'images/youtube.png',
          width: 98,
          height: 22,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.videocam),
              onPressed: () {
                print('acao: videocam');
              }),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('acao: Pesquisa');
              }),
          IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                print('acao: conta');
              })
        ],
      ),
      body: Container(),
    );
  }
}
