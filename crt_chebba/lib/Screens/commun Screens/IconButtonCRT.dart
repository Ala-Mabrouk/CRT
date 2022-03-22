import 'package:flutter/material.dart';

class IconButtonCRT extends StatelessWidget {
  const IconButtonCRT(
      {Key? key,
      required this.myText,
      required this.BackgroundColor,
      required this.TextColor,
      required this.f,
      required this.icon})
      : super(key: key);
  final String myText;
  final Color BackgroundColor;
  final Color TextColor;
  final VoidCallback f;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: TextButton.styleFrom(
          backgroundColor: BackgroundColor,
          primary: TextColor,
        ),
        label: Text(myText),
        icon: Icon(icon),
        onPressed: f);
  }
}
