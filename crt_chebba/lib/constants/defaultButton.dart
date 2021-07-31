import 'package:flutter/material.dart';

import 'package:crt_chebba/constants/constants.dart';

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
      child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {},
          color: kcolor,
          child:
              Text(text, style: TextStyle(fontSize: 20, color: Colors.white))),
    );
  }
}
