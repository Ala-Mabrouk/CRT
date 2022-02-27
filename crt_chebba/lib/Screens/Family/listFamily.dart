/* import 'package:crt_chebba/models/Family.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//************/ THIS CLASS IS NOT USED !!!!!!!************

class FamilyList extends StatefulWidget {
  // const FamilyList({Key? key, dynamic families}) : super(key: key);
  final Stream<List<Family>> a;
  FamilyList({required this.a});

  @override
  _FamilyListState createState() => _FamilyListState();
}

class _FamilyListState extends State<FamilyList> {
  @override
  Widget build(BuildContext context) {
    final families = Provider.of<List<Family>>(context);

    return StreamBuilder(
      //  stream: FamilyList.a,
      builder: (context, snapshot) {
        List<Family> a = snapshot.data as List<Family>;
        return ListView.builder(
            itemCount: families.length,
            itemBuilder: (context, index) {
              return FamilyCard(families[index]);
            });
      },
    );
  }
}

Widget FamilyCard(Family f) {
  return Card(
    clipBehavior: Clip.antiAlias,
    child: Column(
      children: [
        ListTile(
          title: Text('family of' + f.familyName),
          subtitle: Text(
            'f.familyLocation',
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Description : xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.end,
          children: [
            FlatButton(
              onPressed: () {
                // Perform some action
              },
              child: const Text('Voir Details'),
            ),
          ],
        ),
      ],
    ),
  );
}
 */