import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
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
    );
  }
}
