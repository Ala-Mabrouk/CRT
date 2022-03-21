import 'package:crt_chebba/Screens/Administration/Settings.dart';
import 'package:crt_chebba/Screens/Family/ListAllFamilies.dart';
import 'package:crt_chebba/Screens/Profile/profil.dart';
import 'package:crt_chebba/Screens/authentication/login.dart';
import 'package:crt_chebba/Services/authentication_Services/auth.dart';
import 'package:crt_chebba/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomePageDirectionAdmin extends StatefulWidget {
  const HomePageDirectionAdmin({Key? key}) : super(key: key);

  @override
  State<HomePageDirectionAdmin> createState() => _HomePageDirectionAdminState();
}

int _selectedIndex = 0;

class _HomePageDirectionAdminState extends State<HomePageDirectionAdmin> {
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
        return ListAllFamilies();
      case 1:
        return Settings();
      case 2:
        return Profil();
      case 3:
        showAlertDialog(cntx);
        setState(() {
          _selectedIndex = 0;
        });
        return ListAllFamilies();

      default:
        return Settings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBarAdmin(context),
      body: getBody(_selectedIndex, context),
    );
  }

  Widget bottomNavigationBarAdmin(BuildContext context) {
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
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
                icon: LineIcons.home,
                text: 'Acceuil',
              ),
              GButton(
                icon: LineIcons.cog,
                text: 'Paramètres',
              ),
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
                icon: LineIcons.alternateSignOut,
                text: 'Se deconnecter',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
              getBody(index, context);
            },
          ),
        ),
      ),
    );
  }
}
