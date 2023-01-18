import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key, required this.text, required this.press, required this.kcolor})
      : super(key: key);
  final String text;
  final Function press;
  final Color kcolor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          child:
              Text(text, style: TextStyle(fontSize: 20, color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(240, 229, 217, 182),
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          ),
          onPressed: () {},
        ));
  }
}
