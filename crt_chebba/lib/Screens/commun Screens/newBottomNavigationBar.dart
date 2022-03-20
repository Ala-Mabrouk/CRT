import 'package:crt_chebba/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class bottomNavigationBarAgent extends StatefulWidget {
  const bottomNavigationBarAgent({Key? key}) : super(key: key);

  @override
  _bottomNavigationBarAgentState createState() =>
      _bottomNavigationBarAgentState();
}

class _bottomNavigationBarAgentState extends State<bottomNavigationBarAgent> {
  @override
  Widget build(BuildContext context) {
      int _selectedIndex = 0;

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
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
