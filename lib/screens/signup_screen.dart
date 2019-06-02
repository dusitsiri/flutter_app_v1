import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.yellow,
          leading: InkWell(
            splashColor: Colors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          centerTitle: true,
          title: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ],
            ),
          ),
          actions: <Widget>[
           SizedBox(width: 40)
          ],
        ),
      body: Center(

      ),
    );
  }
}