import 'package:flutter/material.dart';

class RowText extends StatelessWidget {
  final String champ1;

  final String champ2;

  const RowText({
    Key? key,
    required this.champ1,
    required this.champ2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Row(
                crossAxisAlignment : CrossAxisAlignment .start,

          children: [
            Text(
              champ1,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Flexible(child: Text(champ2))
          ],
        ),
        SizedBox(height: 5),
      ],
    );
  }
}