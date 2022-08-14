import 'package:cloud_firestore/cloud_firestore.dart';

class EntriesFunctions {
  var fireStore = FirebaseFirestore.instance;
  addEntry(String title, String entry, String date) async {
    await fireStore
        .collection('Journal Entries')
        .add({'Title': title, 'Entry': entry, 'Date': date})
        .then((value) => print('Date: $date\nTitle:$title\nEntry:$entry'))
        .catchError((onError) => print('Entry not added due to $onError'));
  }

  readEntries() async {
    List entries;
//    =await fireStore.collection('Journal Entries').get().then((snapshots) => null);
    await fireStore.collection('Journal Entries').get().then((snapshot) {
      entries = snapshot.docs;
    });
//    snapshots().forEach((doc) {print(
//      doc['title'];
//    ) });
    return entries;
  }
}
