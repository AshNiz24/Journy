import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:journy/components.dart';
import '../constants.dart';
import './addEntryScreen.dart';

class EntryListScreen extends StatefulWidget {
  final List<QueryDocumentSnapshot> docs;
  EntryListScreen(this.docs);
  static const String id = "EntryListScreen";

  @override
  State<EntryListScreen> createState() => _EntryListScreenState();
}

class _EntryListScreenState extends State<EntryListScreen> {
  bool isLoaded = false;

  String title;
  String time;
  String entry;
  int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    getEntries();
  }

//      .then((value) {
//    var p = value.docs;
//  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: kScreenBg,
          child: widget.docs.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    JournyTitle(),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Please Add an entry',
                          style: kButtonText,
                        ),
                      ),
                    ),
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
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    JournyTitle(),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10,
                              ),
                          itemCount: widget.docs.length,
                          itemBuilder: (context, index) {
                            return EntryTile(
                              title: widget.docs.elementAt(index)['Title'],
                              time: widget.docs.elementAt(index)['Date'],
                              entry: widget.docs.elementAt(index)['Entry'],
                            );
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonJourny(
                      label: 'BACK',
                      fn: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
