import 'package:crt_chebba/Screens/commun%20Screens/RowText.dart';
import 'package:crt_chebba/constants/constants.dart';
import 'package:crt_chebba/models/Donation.dart';
import 'package:flutter/material.dart';

class donDetaille extends StatefulWidget {
  final Donation don;

  const donDetaille({Key? key, required this.don}) : super(key: key);

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
              RowText(
                  champ1: 'Date : ',
                  champ2: widget.don.dateDonation.toString()),
              RowText(champ1: 'Equipe : ', champ2: widget.don.Equipe),
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
                    widget.don.publierPar,
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
