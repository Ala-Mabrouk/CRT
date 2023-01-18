import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:crt_chebba/Screens/Administration/Settings.dart';
import 'package:crt_chebba/Screens/Administration/usersList.dart';
import 'package:crt_chebba/Screens/Home/HomePageDirection.dart';
import 'package:crt_chebba/Screens/Home/HomePageDirectionAdmin.dart';
import 'package:crt_chebba/Screens/Family/ListAllFamilies.dart';
import 'package:crt_chebba/Screens/authentication/onHoldScreen.dart';
import 'package:crt_chebba/Services/authentication_Services/auth.dart';
import 'package:crt_chebba/models/AgentsCrt.dart';
import 'package:flutter/material.dart';

import '../authentication/login.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);

  Widget selcetPath(AgentCrt ag) {
    if (ag.email != '') {
      //connected
      if (ag.isConfirmed) {
        if (!ag.isAdmin) {
          return new HomePageDirection();
        } else {
          return new HomePageDirectionAdmin();
        }
      }
      return new HoldOn(
        agentCrt: ag,
      );
    } else {
      return new login();
    }
  }

  @override
  Widget build(BuildContext context) {
//cheking the authentication to choose which screen will be shown

    return Scaffold(
        body: FutureBuilder(
            future: AuthenticationService().autoAthenticate(),
            builder: (context, snapshot) {
              //  print(snapshot.data);
              if (snapshot.hasData) {
                AgentCrt ag = snapshot.data as AgentCrt;
                return AnimatedSplashScreen(
                    duration: 2000,
                    splash: Image.asset('assets/logo.png',height: 200,width: 200,),
                    nextScreen: selcetPath(ag),
                    splashTransition: SplashTransition.fadeTransition,
                    backgroundColor: Colors.grey.shade100);
              }
              return SizedBox();
            }));
  }
}
