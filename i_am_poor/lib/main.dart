import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('I Am Poor'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Image(
          image: AssetImage('images/poorman.png'),
        ),
      ),
    ),
  ));
}

