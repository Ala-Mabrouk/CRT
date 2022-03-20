import 'package:crt_chebba/constants/constants.dart';
import 'package:flutter/material.dart';

class TextButtonCrt extends StatelessWidget {
  const TextButtonCrt(
      {Key? key,
      required this.myText,
      required this.BackgroundColor,
      required this.TextColor,
      required this.f})
      : super(key: key);
  final String myText;
  final Color BackgroundColor;
  final Color TextColor;
  final VoidCallback f;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: f,
      child: Text(myText, style: TextStyle(color: TextColor)),
      style: TextButton.styleFrom(
        backgroundColor: BackgroundColor,
        primary: kWhitColor,
      ),
    );
  }
}
