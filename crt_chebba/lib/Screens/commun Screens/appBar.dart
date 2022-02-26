import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key, required this.myText}) : super(key: key);
  final String myText;
  @override
  Widget build(BuildContext context) {
    return AppBar(flexibleSpace: Container(
        child: Row(
           children: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {},
            child: const Text('Enabled'),
          ),
        ],
        ),
      ),);
  }
}
