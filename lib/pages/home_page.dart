import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../components/post.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "2학년 0반",
          style: (TextStyle(color: Colors.grey.shade900)),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () => FirebaseAuth.instance.signOut(),
        //     icon: Icon(
        //       Icons.logout,
        //       color: Colors.grey[700],
        //     ),
        //   ),
        // ],
      ),
      bottomNavigationBar: Container(
        color: Colors.grey.shade200,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: GNav(
            backgroundColor: Colors.grey.shade200,
            color: Colors.grey[700],
            activeColor: Colors.black,
            tabBackgroundColor: Colors.grey.shade300,
            gap: 8.0,
            onTabChange: (index) {
              print(index); // index별 page전환 구현 예정
            },
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: '홈',
              ),
              GButton(
                icon: Icons.favorite_border,
                text: '좋아요', // 임시값
              ),
              GButton(
                icon: Icons.search,
                text: '검색', // 임시값
              ),
              GButton(
                icon: Icons.settings,
                text: '설정', // 임시값
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.library_books_rounded,
                      size: 50,
                      color: Colors.grey.shade800,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.calendar_month_outlined,
                      size: 50,
                      color: Colors.grey.shade800,
                    ),
                    SizedBox(
                      width: 5,
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("시험범위"),
                    SizedBox(
                      width: 15,
                    ),
                    Text("캘린더"),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text("공지", style: (TextStyle(fontSize: 20))),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Post(
                  nickname: "홍길동",
                  role: "실장",
                ),
                Post(
                  nickname: "홍길동",
                  role: "부실장",
                ),
                Post(
                  nickname: "홍길동",
                  role: "실장",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
