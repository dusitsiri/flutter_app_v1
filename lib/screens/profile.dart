import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('profile screen'),
          onPressed: () {
            // Navigate to second screen when tapped!
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}