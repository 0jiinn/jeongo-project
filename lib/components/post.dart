import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  final String nickname;
  final String role;

  const Post({
    Key? key,
    required this.nickname,
    required this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey.shade400,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 270,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.account_circle_rounded,
                    size: 50,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nickname,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        role,
                        style: TextStyle(fontSize: 13),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
