import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "공지 추가",
            style: (TextStyle(color: Colors.grey.shade900)),
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(CupertinoIcons.back),
            color: Colors.grey[700],
          ),
        ),
      ),
    );
  }
}
