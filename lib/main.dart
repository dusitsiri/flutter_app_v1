import 'package:flutter/material.dart';
import 'service/authentication.dart';
import 'root_page.dart';
import 'package:flutter_login_page_ui/screens/profile_screen.dart';
import 'package:flutter_login_page_ui/screens/signup_screen.dart';
import 'package:flutter_login_page_ui/review/ShowReviewFace.dart';

void main() => runApp(MaterialApp(
  
      initialRoute: '/',
      routes: {
        '/': (context) => new RootPage(auth: new Auth()),
        '/my_profile': (context) => ProfileScreen(),
        '/review': (context) => MyAppReview(),
        '/signup': (context) => SignUpScreen(),
      },
    ));

// void main() {
//   runApp(new MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//        initialRoute: '/',
//       routes: {
//         '/': (context) => new RootPage(auth: new Auth()),
//         '/my_profile': (context) => ProfileScreen(),
//         '/review': (context) => MyAppReview(),
//         '/signup': (context) => SignUpScreen(),
//       }
//         home: new RootPage(auth: new Auth()));
//   }
// }