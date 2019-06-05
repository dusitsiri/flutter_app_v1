import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_login_page_ui/screens/profile_screen.dart';
import 'package:flutter_login_page_ui/service/authentication.dart';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_login_page_ui/Widgets/data.dart';
import 'package:flutter_login_page_ui/Widgets/intro_page_item.dart';
import 'package:flutter_login_page_ui/Widgets/page_transformer.dart';


class ReviewScreen extends StatefulWidget {
    ReviewScreen({Key key, this.auth, this.userId, this.onSignedOut, this.goToPage_Profile})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;
  final VoidCallback goToPage_Profile;

   
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}



class _ReviewScreenState extends State<ReviewScreen> {
  bool _isEmailVerified = false;

 @override
  void initState() {
    super.initState();

    _checkEmailVerification();

  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
      

      
  List<Widget> _buildList =  <Widget>[
      Container(
        decoration: BoxDecoration(
          color: Colors.black45,
        ),
        child: SizedBox.fromSize(
          size: const Size.fromHeight(500.0),
          child: PageTransformer(
            pageViewBuilder: (context, visibilityResolver) {
              return PageView.builder(
                controller: PageController(viewportFraction: 0.85),
                itemCount: sampleItems.length,
                itemBuilder: (context, index) {
                  final item = sampleItems[index];
                  final pageVisibility =
                      visibilityResolver.resolvePageVisibility(index);

                  return IntroPageItem(
                    item: item,
                    pageVisibility: pageVisibility,
                  );
                },
              );
            },
          ),
        ),
      ),
    Text(
      'Index 1: Search',
      style: optionStyle,
    ),
    Text(
      'Index 2: Profile',
      style: optionStyle,
    ),
  ];

  // static const List<Widget> _widgetOptions = <Widget>[
    
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: Search',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: Profile',
  //     style: optionStyle,
  //   ),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _checkEmailVerification() async {
    _isEmailVerified = await widget.auth.isEmailVerified();
    if (!_isEmailVerified) {
      _showVerifyEmailDialog();
    }
  }
  void _resentVerifyEmail(){
    widget.auth.sendEmailVerification();
    _showVerifyEmailSentDialog();
  }
   void _showVerifyEmailDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content: new Text("Please verify account in the link sent to email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Resent link"),
              onPressed: () {
                Navigator.of(context).pop();
                _resentVerifyEmail();
              },
            ),
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content: new Text("Link to verify account has been sent to your email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
            icon: new Icon(
              Icons.rate_review,
              color: Colors.black,
            ),
            tooltip: 'rate review',
            onPressed: (){
              Navigator.pushNamed(context, '/rate_reviews');
            },
          ),
          IconButton(
            icon: new Icon(
              Icons.portrait,
              color: Colors.black,
            ),
            tooltip: 'my profile',
            onPressed: () {
              // Navigator.pushNamed(context, '/profile');
               widget.goToPage_Profile();
            },
          ),
          SizedBox(
            width: ScreenUtil.getInstance().setWidth(10),
          ),
        ],
      ),
      body: Center(
        child: _buildList.elementAt(_selectedIndex),
      ),
      
      //       body: Center(
      //   child: SizedBox.fromSize(
      //     size: const Size.fromHeight(500.0),
      //     child: PageTransformer(
      //       pageViewBuilder: (context, visibilityResolver) {
      //         return PageView.builder(
      //           controller: PageController(viewportFraction: 0.85),
      //           itemCount: sampleItems.length,
      //           itemBuilder: (context, index) {
      //             final item = sampleItems[index];
      //             final pageVisibility =
      //                 visibilityResolver.resolvePageVisibility(index);

      //             return IntroPageItem(
      //               item: item,
      //               pageVisibility: pageVisibility,
      //             );
      //           },
      //         );
      //       },
      //     ),
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text('My Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
