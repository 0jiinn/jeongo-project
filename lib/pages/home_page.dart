import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../components/post.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

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
            "0학년 0반", // 회원가입할 때 쓰여진 학년과 반에 따라서 각 학급별 Home_Page로 이동시킬 예정.
            style: (TextStyle(color: Colors.grey.shade900)),
          ),
          actions: [ // 이 로그아웃 action은 추후 삭제하고 설정 Page로 이동시킬 예정.
            IconButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              icon: Icon(
                Icons.logout,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
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
              print(index); // Page전환 구현 예정.
            },
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.school, // 적합한 Icon 있으면 적용 바람.
                text: '학급',
              ),
              GButton(
                icon: Icons.newspaper,
                text: '소식', // 임시값
              ),
              GButton(
                icon: Icons.search,
                text: '검색', // 임시값
              ),
              GButton(
                icon: Icons.settings,
                text: '설정',
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
                  // scroll해도 이 Row가 고정되도록 구현 예정_1.
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.library_books_rounded,
                          size: 50,
                          color: Colors.grey.shade800,
                        ),
                        Text("시험범위"),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          size: 50,
                          color: Colors.grey.shade800,
                        ),
                        Text("캘린더"),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                Row(
                  // scroll해도 이 Row가 고정되도록 구현 예정_2.
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text("공지",
                        style: (TextStyle(
                            fontSize: 17, color: Colors.grey.shade900))),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),

                // 밑의 POST는 고정된 위치의 오른쪽 하단 +버튼 구성 후 클릭시 추가되도록 할 예정.

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
