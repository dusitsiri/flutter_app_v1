import 'package:flutter/material.dart';
import 'package:flutter_login_page_ui/service/authentication.dart';

import 'package:flutter_login_page_ui/screens/profile_screen.dart';
import 'package:flutter_login_page_ui/screens/signup_screen.dart';
import 'package:flutter_login_page_ui/screens/review_screen.dart';
import 'package:flutter_login_page_ui/screens/emotions_review/ShowReviewFace.dart';
import 'package:flutter_login_page_ui/screens/root_page.dart';


void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => new RootPage(auth: new Auth()),
        // '/my_profile': (context) => ProfileScreen(),
        '/review': (context) => ReviewScreen(),
        '/signup': (context) => SignUpScreen(),
        '/profile': (context) => ProfileScreen(),
        '/rate_reviews': (context) => RateReviewScreen(),
      },
    ));
