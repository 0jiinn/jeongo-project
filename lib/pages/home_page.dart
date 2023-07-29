import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


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
        // leading: Builder(
        //   builder: (BuildContext context) {
        //     return IconButton(
        //       icon: Icon(Icons.menu, color: Colors.grey[700]),
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //     );
        //   },
        // ),
        actions: [
          IconButton(
            onPressed: () => FirebaseAuth.instance.signOut(),
            icon: Icon(
              Icons.logout,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: [
      //       UserAccountsDrawerHeader(
      //         accountName: Text("홍길동"), // displayName 기능 만들어서 넣을예정
      //         accountEmail: Text("${user.email}"),
      //         currentAccountPicture: CircleAvatar(
      //           child: Icon(
      //             Icons.account_circle_rounded,
      //             color: Colors.indigo,
      //           ),
      //           backgroundColor: Colors.white,
      //         ),
      //         decoration: BoxDecoration(
      //           color: Colors.indigo[500],
      //         ),
      //       ),
      //       ListTile(
      //         title: Text("empty"),
      //       ),
      //     ],
      //   ),
      // ),
      bottomNavigationBar: Container(
        color: Colors.grey.shade200,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.grey.shade200,
            color: Colors.grey[700],
            activeColor: Colors.black,
            tabBackgroundColor: Colors.grey.shade300,
            gap: 8,
            onTabChange: (index) {
              print(index); // 페이지 넣을 예정
            },
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: '홈',
              ),
              GButton(
                icon: Icons.favorite_border,
                text: '임시',
              ),
              GButton(
                icon: Icons.search,
                text: '임시',
              ),
              GButton(
                icon: Icons.settings,
                text: '임시',
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
