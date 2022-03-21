import 'package:flutter/material.dart';

class TextFiledContainerType2 extends StatelessWidget {
  final Widget child;
  const TextFiledContainerType2({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: size.width * 0.9,
      child: child,
    );
  }
}
