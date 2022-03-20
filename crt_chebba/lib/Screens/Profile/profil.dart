import 'package:crt_chebba/Screens/authentication/login.dart';
import 'package:crt_chebba/Screens/commun%20Screens/AppBarCrt.dart';
import 'package:crt_chebba/Screens/commun%20Screens/bottomNavigationBarAgentCRT.dart';
import 'package:crt_chebba/Screens/commun%20Screens/loading.dart';
import 'package:crt_chebba/Services/authentication_Services/auth.dart';
import 'package:crt_chebba/Services/usersServices/UserServices.dart';
import 'package:crt_chebba/models/AgentsCrt.dart';
import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  String uID = '';
  AgentCrt _user = AgentCrt.empty();

  Future<AgentCrt> getUserById(String id) async {
    return await UserServices().getUserInfo(id);
  }

  @override
  void initState() {
    print("profil is displayed");
    super.initState();
    /*    SharedPreferences.getInstance().then((prefValue) => {
          setState(() {
            uID = prefValue.getString('UserID') ?? "#####";
          })
        }); */
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    /*    Future logOut() {
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
                      MaterialPageRoute(builder: (context) => const login()),
                      (route) => false);
                  //(context,MaterialPageRoute(builder: (context) => const signIn()));
                },
              )
            ],
          );
        },
      );
    } */

    return Scaffold(
      // bottomNavigationBar: bottomNavigationBarAgent(),
      body: SafeArea(
        child: Column(
          children: [
            AppBarCrt(info: 'Profile', nomFamille: ""),
            Center(
              child: FutureBuilder(
                  future: UserServices().getUserInfo(uID),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const Text('No connection with data base !!!');
                      case ConnectionState.waiting:
                        return const Center(child: Loding());
                      default:
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              '${snapshot.error} occured',
                              style: const TextStyle(fontSize: 18),
                            ),
                          );

                          // if we got our data
                        } else if (snapshot.hasData) {
                          _user = snapshot.data as AgentCrt;
                          return Column(
                            children: [
                              Stack(
                                children: [
                                  ClipOval(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Ink.image(
                                        image: NetworkImage(_user.name),
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover,
                                        child: InkWell(
                                          onTap: () {},
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                                _user.name + ' ' + _user.lastName,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          );
                        }
                        return const Center(
                          child: Text("Missing Data"),
                        );
                    }
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              icon: const Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 27.0,
                ),
              ),
              label: const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Text(
                  'Modifier mes coordonnées',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              onPressed: () {
                _user.agentId = uID;
                /*  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChangeInfo(
                            passedUser: _user,
                          )),
                ); */
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.grey.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
