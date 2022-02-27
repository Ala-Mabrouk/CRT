
import 'package:crt_chebba/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:phone_caller/phone_caller.dart';

class AppBarCrt extends StatefulWidget {
  final String nomFamille;

  const AppBarCrt({Key? key , required this.nomFamille}) : super(key: key);

  @override
  _AppBarCrtState createState() => _AppBarCrtState();
}

class _AppBarCrtState extends State<AppBarCrt> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: kLightGreyColor,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(width: 10),
        iconAppBarBack(
          color: kSecondryColor,
          icon: Icons.arrow_back_ios_new_outlined,
        ),
        Row(
          children: [
            Text(
              'Les dons :',
              style: TextStyle(fontWeight: FontWeight.bold, color: kSecondryColor),
            ),
             Text(
         widget.nomFamille,
          style:
              TextStyle(fontWeight: FontWeight.normal, color: kSecondryColor),
        ),
          ],
        ),
       
        iconAppBarphone(
          color: kGreenColor,
          icon: Icons.phone,
        ),
        SizedBox(width: 10),
      ]),
    );
  }
}


class iconAppBarphone extends StatefulWidget {
  final Color color;
  final IconData icon;

  const iconAppBarphone({
    Key? key,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  _iconAppBarphoneState createState() => _iconAppBarphoneState();
}

class _iconAppBarphoneState extends State<iconAppBarphone> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      //   color: kGreenColor,
      decoration: BoxDecoration(
          color: widget.color,
          border: Border.all(
            color: widget.color,
          ),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: IconButton(
        icon: Icon(
          widget.icon,
          color: kWhitColor,
          size: 13,
        ),
        onPressed: () async {
          await PhoneCaller.callNumber('number');
        },
      ),
    );
  }

  void onPress() {}
}

class iconAppBarBack extends StatefulWidget {
  final Color color;
  final IconData icon;
  const iconAppBarBack({
    Key? key,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  _iconAppBarBackState createState() => _iconAppBarBackState();
}

class _iconAppBarBackState extends State<iconAppBarBack> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        width: 35,
        //   color: kGreenColor,
        decoration: BoxDecoration(
            color: widget.color,
            border: Border.all(
              color: widget.color,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: IconButton(
          icon: Icon(
            widget.icon,
            color: kWhitColor,
            size: 13,
          ),
          onPressed: () => Navigator.of(context).pop(true),
        ));
  }

  void onPress() {}
}