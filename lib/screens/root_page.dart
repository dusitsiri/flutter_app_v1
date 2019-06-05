import 'package:flutter/material.dart';
import 'login_signup_page.dart';
import 'package:flutter_login_page_ui/service/authentication.dart';

import 'package:flutter_login_page_ui/screens/profile_screen.dart';
import 'package:flutter_login_page_ui/screens/review_screen.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

enum Pages {
  LOGIN,
  PROFILE,
  REVIEW
}


class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  Pages pages = Pages.LOGIN;
  String _userId = "";

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
        }
        authStatus =
            user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
  }

  void _onLoggedIn() {
    widget.auth.getCurrentUser().then((user){
      setState(() {
        _userId = user.uid.toString();
      });
    });
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;
      pages = Pages.REVIEW;
    });
  }

  void _onSignedOut() {
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
      _userId = "";
    });
  }

    void _goToPage_Review() {

 setState(() {
      pages = Pages.REVIEW;
    });
}
  
   void _goToPage_Profile() {

  setState(() {
      pages = Pages.PROFILE;
    });
  
  }

  Widget _buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return _buildWaitingScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return new LoginSignUpPage(
          auth: widget.auth,
          onSignedIn: _onLoggedIn,

        );
        break;
      case AuthStatus.LOGGED_IN:
        if (_userId.length > 0 && _userId != null) {
            switch (pages){
              case Pages.REVIEW:
                  return new ReviewScreen(
                   userId: _userId,
                   auth: widget.auth,
                   onSignedOut: _onSignedOut,
                   goToPage_Profile:_goToPage_Profile,

                    );
                    break;
            case Pages.PROFILE:
                  return new ProfileScreen(
                   userId: _userId,
                   auth: widget.auth,
                   onSignedOut: _onSignedOut,
                   goToPage_Review:_goToPage_Review,

                    );
                  break;
            case Pages.LOGIN:
                return new LoginSignUpPage(
                auth: widget.auth,
                 onSignedIn: _onLoggedIn,
                      );
            }

        } else return _buildWaitingScreen();
        break;
      default:
        return _buildWaitingScreen();
    }
  }
}