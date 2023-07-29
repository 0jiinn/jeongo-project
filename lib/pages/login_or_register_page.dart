import 'package:flutter/material.dart';
import 'package:jeongotalk/pages/resister_page.dart';

import 'login_page.dart';

class LoginOrResisterPage extends StatefulWidget {
  const LoginOrResisterPage({Key? key}) : super(key: key);

  @override
  State<LoginOrResisterPage> createState() => _LoginOrResisterPageState();
}

class _LoginOrResisterPageState extends State<LoginOrResisterPage> {

  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return LoginPage(
        onTap: togglePages,
      );
    } else {
      return ResisterPage(onTap: togglePages,);
    }
  }
}
