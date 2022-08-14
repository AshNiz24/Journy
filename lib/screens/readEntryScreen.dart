import 'package:flutter/material.dart';
import 'package:journy/components.dart';
import '../constants.dart';

class ReadEntryScreen extends StatelessWidget {
  static const String id = "Read Entry Screen";
  @required
  final String title;
  @required
  final String entry;
  @required
  final String date;

  ReadEntryScreen({this.entry, this.title, this.date});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: kScreenBg,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              JournyTitle(),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  padding: EdgeInsets.only(
                    bottom: 5,
                    right: 10,
                    left: 10,
                    top: 12,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2.5,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        20,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${date.substring(5, 17).trim()}\n${date.substring(0, 5)}${date.substring(17).trim()}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 5,
                        color: Colors.white,
                        endIndent: 20,
                        height: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              entry,
                              softWrap: true,
                              maxLines: 50,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
