import 'package:crt_chebba/constants/constants.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      height: 70,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        SizedBox(width: 10),
        Row(
          children: [
            Text('Salut : ',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: kBlackColor)),
            Text('widget.nomFamille' + ' !',
                style: TextStyle(
                    fontWeight: FontWeight.normal, color: kBlackColor)),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: kLightGreyColor),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://www.keejob.com/media/recruiter/recruiter_7343/logo-croissant-rouge-tunisien-20141110-092435.jpg'),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}

// Container(
    //     height: 70,
    //     decoration: BoxDecoration(
    //       color: kGreyColor.withOpacity(0.15),
    //       borderRadius: BorderRadius.circular(10),
    //       border: Border.all(
    //         color: kLightGreyColor,
    //       ),
    //     ),
    //     child: Padding(
    //       padding: const EdgeInsets.fromLTRB(30, 8, 8, 8),
    //       child: Row(mainAxisAlignment  : MainAxisAlignment.spaceBetween,
    //         children: [
    //           RowText(champ1: 'Salut', champ2: 'User'),
    //           Row(
    //             children: [
    //               SizedBox(width: 30,),
    //               Container(
    //                 width: 30,
    //                 height: 30,
    //                 decoration: BoxDecoration(
    //                   border: Border.all(color: kLightGreyColor),
    //                   image: const DecorationImage(
    //                     image: AssetImage('assets/logo.png'),
    //                     fit: BoxFit.fill,
    //                   ),
    //                   shape: BoxShape.rectangle,
    //                 ),
    //               ),                  SizedBox(width: 30,),

    //             ],
    //           )
    //         ],
    //       ),
    //     ));