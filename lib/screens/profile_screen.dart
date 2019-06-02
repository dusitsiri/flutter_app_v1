import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  
  @override
  _reviewScreenState createState() => new _reviewScreenState();

}
class _reviewScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
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
              Navigator.pushNamed(context, '/review');
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
                  'My Profile',
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              tooltip: 'edit profile',
            ),
          ],
        ),
        body: new Stack(
      children: <Widget>[
        ClipPath(
          child: Container(color: Colors.black.withOpacity(0.8)),
          clipper: getClipper(),
        ),
        Positioned(
            width: 390.0,
            top: MediaQuery.of(context).size.height / 5.2,
            child: Column(
              children: <Widget>[
                Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://pbs.twimg.com/profile_images/924839621678178305/90xAQtsq_400x400.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Colors.black)
                        ])),
                SizedBox(height: 50.0),
                Text(
                  'Aroii Team',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Spectral'),
                ),
                SizedBox(height: 15.0),
                Text(
                  'Subscribe guys',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Spectral'),
                ),
                SizedBox(height: 25.0),
                Container(
                    height: 30.0,
                    width: 95.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'Edit Name',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Spectral'),
                          ),
                        ),
                      ),
                    )),
                SizedBox(height: 25.0),
                Container(
                    height: 30.0,
                    width: 95.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.redAccent,
                      color: Colors.red,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/');
                        },
                        child: Center(
                          child: Text(
                            'Log out',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Roboto'),
                          ),
                        ),
                      ),
                    ))
              ],
            ))
      ],
    ));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
