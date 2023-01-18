import 'package:crt_chebba/Screens/commun%20Screens/AppBarCrt.dart';
import 'package:crt_chebba/constants/constants.dart';
import 'package:flutter/material.dart';
 
class AppBarCrtType2 extends StatefulWidget {
  final String champ1;
  final String champ2;

  const AppBarCrtType2({Key? key, required this.champ1, required this.champ2})
      : super(key: key);

  @override
  _AppBarCrtType2State createState() => _AppBarCrtType2State();
}

class _AppBarCrtType2State extends State<AppBarCrtType2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          color: kGreyColor.withOpacity(0.4),
          child: Row(children: [
            SizedBox(width: 30),
            iconAppBarBack(
              color: kSecondryColor,
              icon: Icons.arrow_back_ios_new_outlined,
            ),
            SizedBox(width: 30),
            Row(
              children: [
                Text(
                  widget.champ1,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: kSecondryColor),
                ),
                Text(
                  widget.champ2,
                  style: TextStyle(
                      fontWeight: FontWeight.normal, color: kSecondryColor),
                ),
              ],
            ),
            SizedBox(width: 10),
          ]),
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}

