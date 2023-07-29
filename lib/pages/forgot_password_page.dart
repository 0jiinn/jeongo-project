import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        elevation: 0,
      ),
      body: Column(
        children: [
          MyTextField(
            controller: emailController,
            hintText: '아직안만듦',
            obscureText: false,
          ),
          MyButton(
            onTap: () {
            },
            text: "아직안만듦",
          ),
        ],
      ),
    );
  }
}
