import 'package:flutter/material.dart';

class IconButtonCRT extends StatelessWidget {
  const IconButtonCRT(
      {Key? key,
      required this.myText,
      required this.BackgroundColor,
      required this.TextColor,
      required this.f(),
      required this.icon})
      : super(key: key);
  final String myText;
  final Color BackgroundColor;
  final Color TextColor;
  final Function f;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: TextButton.styleFrom(
          backgroundColor: BackgroundColor,
          primary: TextColor,
        ),
        label: Text(myText , style: TextStyle( color: TextColor),),
        icon: Icon(icon , color : TextColor),
        onPressed: f());
  }
}
