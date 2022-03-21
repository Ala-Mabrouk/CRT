import 'package:crt_chebba/Screens/Family/ListAllFamilies.dart';
import 'package:crt_chebba/Screens/Family/ListAllFamilies.dart';
import 'package:crt_chebba/Screens/Profile/profil.dart';
import 'package:crt_chebba/Screens/authentication/login.dart';
import 'package:crt_chebba/Screens/commun%20Screens/bottomNavigationBarAgentCRT.dart';
import 'package:crt_chebba/Services/authentication_Services/auth.dart';
import 'package:crt_chebba/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomePageDirection extends StatefulWidget {
  const HomePageDirection({Key? key}) : super(key: key);

  @override
  State<HomePageDirection> createState() => _HomePageDirectionState();
}

int selectedIndex = 1;

class _HomePageDirectionState extends State<HomePageDirection> {
  showAlertDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Deconnexion')),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Vous êtes sur le point de vous déconnecter ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                child: const Text('Annuler'),
                onPressed: () {
                  print('alert dissmiss');
                  Navigator.pop(context);
                }),
            TextButton(
              child: const Text('Déconnecter'),
              onPressed: () async {
                print('you are loged out !!!');
                await AuthenticationService().logout();

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => new login()),
                    (route) => false);
                //(context,MaterialPageRoute(builder: (context) => const signIn()));
              },
            )
          ],
        );
      },
    );
  }

  Widget getBody(int index, BuildContext cntx) {
    switch (index) {
      case 0:
        return new Profil();
      case 1:
        return ListAllFamilies();

      case 2:
        showAlertDialog(cntx);
        setState(() {
          selectedIndex = 1;
        });
        return ListAllFamilies();

      default:
        return ListAllFamilies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBarAgent(context),
      body: getBody(selectedIndex, context),
    );
  }

  Widget bottomNavigationBarAgent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: kPurpleColor,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 1, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: kLightPurpleColor,
            color: Colors.black,
            tabs: [
              GButton(
                icon: LineIcons.user,
                leading: CircleAvatar(
                  radius: 12,
                  backgroundImage: NetworkImage(
                      'https://www.keejob.com/media/recruiter/recruiter_7343/logo-croissant-rouge-tunisien-20141110-092435.jpg'),
                ),
                text: 'Profile',
              ),
              GButton(
                icon: LineIcons.home,
                text: 'Acceuil',
              ),
              GButton(
                icon: LineIcons.alternateSignOut,
                text: 'Se deconnecter',
              ),
            ],
            selectedIndex: selectedIndex,
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
                getBody(index, context);
              });
            },
          ),
        ),
      ),
    );
  }
}
