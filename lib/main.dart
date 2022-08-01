import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/screen_four.dart';
import 'screens/screen_one.dart';
import 'screens/screen_three.dart';
import 'screens/screen_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Beyond',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Beyond'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // void _incrementCounter() {
  //   setState(() {
  //
  //   });
  // }
  TabController? _tabController;
  // final _tabs = [
  //   const Tab(
  //     child: Icon(
  //       Icons.camera_alt,
  //       color: Colors.white,
  //     ),
  //   ),
  //   const Tab(
  //     child: Text(
  //       "CHATS",
  //       style: TextStyle(fontWeight: FontWeight.bold),
  //     ),
  //   ),
  //   const Tab(
  //     child: Expanded(
  //       flex: 2,
  //       child: Text(
  //         "STATUS",
  //         style: TextStyle(fontWeight: FontWeight.bold),
  //       ),
  //     ),
  //   ),
  //    Tab(
  //     child: SizedBox(
  //       width: MediaQuery.of(context).size.width*.3,
  //       child: Text(
  //         "CALLS",
  //         style: TextStyle(fontWeight: FontWeight.bold),
  //       ),
  //     ),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Color(0xff128C7E),

            // Status bar brightness (optional)
            statusBarIconBrightness: Brightness.light,
            // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          title: Text(widget.title),
          backgroundColor: const Color(0xff128C7E),
          actions: const [
            Icon(Icons.search),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.more_vert),
          ],
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48.0),
              child: TabBar(
                physics: const NeverScrollableScrollPhysics(),
                isScrollable: true,
                dragStartBehavior: DragStartBehavior.start,
                controller: _tabController,
                // labelColor: Colors.blue,
                // unselectedLabelColor: Colors.white,
                tabs: [
                   Tab(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*.1,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Tab(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*.2,
                      child: Text(
                        "CHATS",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                   Tab(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*.2,
                      child: Text(
                        "STATUS",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Tab(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*.2,
                      child: Text(
                        "CALLS",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
                indicatorColor: Colors.white,
              )),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            CameraScreen(),
            ChatsScreen(),
            StatusScreen(),
            CallsScreen()
          ],
        ),
      ),
    );
  }
}
