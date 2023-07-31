import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jeongotalk/pages/auth_page.dart';
import 'firebase_options.dart';

// for Android Studio with MacOS
// command + option + L => 코드 자동 정렬
// command + \ => hot reload

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}

