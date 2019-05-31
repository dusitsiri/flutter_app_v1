import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
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
                  'Reviews Feed',
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: new Icon(Icons.portrait, color: Colors.black,),
              tooltip: 'my profile',
              onPressed: (){
                Navigator.pushNamed(context, '/my_profile');
              },
            ),
          ],
        ),

      body: Center(

      ),
    );
  }
}