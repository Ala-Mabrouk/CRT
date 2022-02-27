
import 'package:crt_chebba/Screens/commun%20Screens/RowText.dart';
import 'package:crt_chebba/constants/constants.dart';
import 'package:flutter/material.dart';

class donDetaille extends StatefulWidget {
  final String date;
  final String ajouterPar;
  final String equipe;

  const donDetaille(
      {Key? key,
      required this.date,
      required this.ajouterPar,
      required this.equipe})
      : super(key: key);

  @override
  _donDetailleState createState() => _donDetailleState();
}

class _donDetailleState extends State<donDetaille> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: kGreyColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: kLightGreyColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 8, 20, 8),
          child: Column(
            children: [
              RowText(champ1: 'Date : ', champ2: widget.date),
              
              RowText(champ1: 'Equipe : ', champ2: widget.equipe),
              RowText(champ1: 'Description : ', champ2: ''),
              Row(
                children: [
                  Text('* data \n* data \n* data \n* data \n'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Ajouté par : ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: kSecondryColor),
                  ),
                  Text(
                    widget.ajouterPar,
                    style: TextStyle(color: kSecondryColor),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
