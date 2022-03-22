import 'package:crt_chebba/Screens/Family/ListAllFamilies.dart';
import 'package:crt_chebba/Screens/Profile/profil.dart';
import 'package:crt_chebba/Services/authentication_Services/auth.dart';
import 'package:crt_chebba/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class bottomNavigationBarAdmin extends StatefulWidget {
  const bottomNavigationBarAdmin({Key? key}) : super(key: key);

  @override
  _bottomNavigationBarAdminState createState() =>
      _bottomNavigationBarAdminState();
}

class _bottomNavigationBarAdminState extends State<bottomNavigationBarAdmin> {
  showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: Container(
            height: 250,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white70,
                    child: const Icon(
                      Icons.account_balance_wallet,
                      size: 60,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: SizedBox.expand(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "vous venez de se deconnecter !! ",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RaisedButton(
                                    color: Colors.white,
                                    child: const Text('Annuler'),
                                    onPressed: () =>
                                        {Navigator.of(context).pop()},
                                  ),
                                  RaisedButton(
                                      color: Colors.blue,
                                      child: const Text('Continuer'),
                                      onPressed: () {
                                        AuthenticationService().logout();
                                        Navigator.pushNamed(context, '/login');
                                      }),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget moveTo(int index, BuildContext cntx) {
    switch (index) {
      case 0:
        return Profil();
      case 1:
        return ListAllFamilies();
      case 2:
        return ListAllFamilies();
      case 3:
        showAlertDialog(cntx);
        setState(() {
          _selectedIndex = 1;
        });

        return ListAllFamilies();
        break;

      default:
        return ListAllFamilies();
    }
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
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
              moveTo(index, context);
            },
          ),
        ),
      ),
    );
  }
}
