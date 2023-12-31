import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:jeongotalk/components/my_textfield.dart';
import 'package:jeongotalk/pages/login_page.dart';
import '../components/post.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final textController = TextEditingController();

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  void showPopup(context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "공지 추가",
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  // 왜 이거 적용이 안되는거지??
                  controller: textController,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "공지할 내용을 적어주세요.",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    contentPadding: EdgeInsets.symmetric(vertical: 120),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: postMessage,
                    child: Text(
                      "업로드",
                      style:
                          TextStyle(color: Colors.grey.shade900, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
      },
    );
  }

  void postMessage() {
    if (textController.text.isNotEmpty) {
      FirebaseFirestore.instance.collection('User Posts').add({
        'UserEmail': currentUser.email,
        'Role': "직업",
        'Message': textController.text,
        'TimeStamp': Timestamp.now(),
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "0학년 0반", // 회원가입할 때 쓰여진 학년과 반에 따라서 각 학급별 Home_Page로 이동시킬 예정.
            style: (TextStyle(color: Colors.grey.shade900)),
          ),
          centerTitle: true,
          actions: [
            // 이 로그아웃 action은 추후 삭제하고 설정 Page로 이동시킬 예정.
            IconButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              icon: Icon(
                Icons.logout,
                color: Colors.grey[700],
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Column(
                      children: [
                        // Icon(
                        //   Icons.library_books_rounded,
                        //   size: 50,
                        //   color: Colors.grey.shade800,
                        // ),
                        IconButton(
                          onPressed: () {},
                          iconSize: 50,
                          icon: Icon(Icons.library_books_rounded),
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
                        // Icon(
                        //   Icons.calendar_month_outlined,
                        //   size: 50,
                        //   color: Colors.grey.shade800,
                        // ),
                        IconButton(
                          onPressed: () {},
                          iconSize: 50,
                          icon: Icon(Icons.calendar_month_outlined),
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
              ],
            ),
          )),
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
      floatingActionButton: Container(
        height: 75.0,
        width: 75.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => AddPostPage()),
              // );
              showPopup(context);
            },
            backgroundColor: Colors.grey.shade700,
            elevation: 0,
            child: const Icon(Icons.add),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("User Posts")
                    .orderBy(
                      "TimeStamp",
                      descending: false,
                    )
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final post = snapshot.data!.docs[index];
                        return Post(
                          nickname: post['UserEmail'],
                          role: post['Role'],
                          message: post['Message'],
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error : ${snapshot.error}"),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
