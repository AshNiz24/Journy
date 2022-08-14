import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:journy/constants.dart';
import 'package:journy/screens/addEntryScreen.dart';
import 'package:journy/screens/readListScreen.dart';
import '../components.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import '../functionality/fireStoreConnect.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = "Welcome Screen";
//  Map<String, dynamic> entriesList = {};
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: kScreenBg,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              JournyTitle(),
              SizedBox(
                height: h * (39 / 896),
              ),
              Image(
                image: AssetImage(
                  'images/journal_color.png',
                ),
                height: h * (210 / 896),
                width: w * (210 / 414),
              ),
              SizedBox(
                height: h * (72 / 896),
              ),
              ButtonJourny(
                  label: 'Read Entries',
                  fn: () async {
                    await FirebaseFirestore.instance
                        .collection('Journal Entries')
                        .get()
                        .then((snapshot) {
                      List<QueryDocumentSnapshot> docList = snapshot.docs;
                      docList.forEach(
                        (element) {
                          print(element['Title']);
                        },
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EntryListScreen(docList)));
                    });
                  }),
              SizedBox(
                height: 20,
              ),
              ButtonJourny(
                label: 'Add entry',
                fn: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddEntryScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
