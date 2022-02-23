import 'package:crt_chebba/Screens/authentication/login.dart';
import 'package:crt_chebba/Services/authentication_Services/auth.dart';
import 'package:flutter/material.dart';

class BottumNavigationBar extends StatelessWidget {
  const BottumNavigationBar({Key? key}) : super(key: key);

//tap function
  void onTap(int val, BuildContext context) {
    switch (val) {
      case 0:
        print('compte screen');
        break;
      case 1:
        print('home screen');
        break;
      case 2:
        _showMyDialog(context);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.logout),
          label: 'Deconnexion',
        ),
      ],
      currentIndex: 1,
      selectedItemColor: Colors.red,
      onTap: (val) {
        onTap(val, context);
      },
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Log out')),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('you are about to log out ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                child: const Text('Dismiss'),
                onPressed: () {
                  print('alert dissmiss');
                  Navigator.pop(context);
                }),
            TextButton(
              child: const Text('Log out'),
              onPressed: () async {
                print('you are loged out !!!');
                await AuthenticationService().logout();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => login()),
                    (route) => false);
              },
            )
          ],
        );
      },
    );
  }
}
