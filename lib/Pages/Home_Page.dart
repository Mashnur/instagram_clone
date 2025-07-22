import 'package:flutter/material.dart';
import 'package:instagram_clone/Pages/feed_page.dart';
import 'package:instagram_clone/Pages/profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentPgae = 0;

  final List<Widget> _pages = [FeedPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Finstagram"),
            const SizedBox(width: 70),
            GestureDetector(child: const Icon(Icons.add_a_photo)),
            const SizedBox(width: 50),
            GestureDetector(onTap: () {}, child: const Icon(Icons.logout)),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
      body: _pages[_currentPgae],
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentPgae,
      onTap: (_index) {
        setState(() {
          _currentPgae = _index;
        });
      },
      items: const [
        BottomNavigationBarItem(label: "feed", icon: Icon(Icons.feed)),
        BottomNavigationBarItem(
          label: "profile",
          icon: Icon(Icons.account_box),
        ),
      ],
    );
  }
}
