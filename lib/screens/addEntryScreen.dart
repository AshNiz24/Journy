import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:journy/components.dart';
import 'package:journy/functionality/fireStoreConnect.dart';
import '../constants.dart';

class AddEntryScreen extends StatefulWidget {
  static const String id = "Add Entry Screen";

  @override
  State<AddEntryScreen> createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  TextEditingController titleText = TextEditingController();
  TextEditingController entryText = TextEditingController();
  DateFormat dateFormat = DateFormat('dd/MM/yyyy HH:mm');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: kScreenBg,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              JournyTitle(),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                decoration: kTextField,
                child: Center(
                  child: TextFormField(
                    controller: titleText,
                    cursorColor: Colors.white,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Entry Title*',
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(
                          0.7,
                        ),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2.5,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        15,
                      ),
                    ),
                  ),
                  child: TextFormField(
                    cursorColor: Colors.white,
                    maxLines: 10,
                    keyboardType: TextInputType.multiline,
                    controller: entryText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Create new Entry",
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonJourny(
                label: 'SAVE',
                fn: () {
                  if (titleText.text == null || entryText.text == null)
                    print("Enter Title and Entry please");
                  else if (titleText.text != null && entryText.text != null) {
                    EntriesFunctions().addEntry(titleText.text, entryText.text,
                        DateFormat.yMMMEd().add_jm().format(DateTime.now()));
                    setState(() {
                      titleText.clear();
                      entryText.clear();
                    });
                  }
                },
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleText.dispose();
    entryText.dispose();
    super.dispose();
  }
}
