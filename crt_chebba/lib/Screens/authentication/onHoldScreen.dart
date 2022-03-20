import 'package:crt_chebba/Screens/commun%20Screens/IconButtonCRT.dart';
import 'package:crt_chebba/constants/constants.dart';
import 'package:flutter/material.dart';

class HoldOn extends StatefulWidget {
  const HoldOn({Key? key}) : super(key: key);

  @override
  _HoldOnState createState() => _HoldOnState();
}

class _HoldOnState extends State<HoldOn> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: kGreyColor.withOpacity(0.4),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
                width: size.width,
                height: size.height * 0.7 - 50,
                child: Column(
                  children: [
                    SizedBox(height: 150),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Bonjour cher(e) ',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' Ben Ali Adem ',
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Merci d\'avoir créer un compte !',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 30),
                    Text('veuillez contactez un admin pour '),
                    Text(' confirmer la création de votre compte'),
                    SizedBox(height: 30),
                    IconButtonCRT(
                      BackgroundColor: kPrimaryColor,
                      f: () {},
                      icon: Icons.refresh,
                      myText: 'Actualiser',
                      TextColor: kWhitColor,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              right: size.width * 0.5 - 100,
              top: size.height * 0.3 - 80,
              child: Image(height: 200, image: AssetImage('assets/logo.png')),
            ),
          ],
        ),
      ),
    );
  }
}
