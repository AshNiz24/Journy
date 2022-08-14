import 'package:flutter/material.dart';
import 'package:journy/screens/readEntryScreen.dart';
import 'constants.dart';

class JournyTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          'Journy',
          style: TextStyle(
            fontSize: 64,
            fontFamily: 'Pacifico',
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 10
              ..color = Color(0xff00114F),
          ),
        ),
        // Solid text as fill.
        Text(
          'Journy',
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontWeight: FontWeight.bold,
            fontSize: 64,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class ButtonJourny extends StatelessWidget {
  @required
  final String label;
  @required
  final Function fn;
  ButtonJourny({this.label, this.fn});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fn,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 3,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          border: Border.all(
            width: 3,
            color: Colors.white,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: kButtonText,
          ),
        ),
      ),
    );
  }
}

class EntryTile extends StatelessWidget {
  final String title;
  final String entry;
  final String time;
  EntryTile({this.entry, this.title, this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        10,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            15,
          ),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 7),
            blurRadius: 3,
            color: Colors.black.withOpacity(0.25),
          ),
        ],
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReadEntryScreen(
                title: title,
                date: time,
                entry: entry,
              ),
            ),
          );
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 28,
            color: Color(0xff00114F),
          ),
        ),
        subtitle: Text(
          entry,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Color(0xff00114F).withOpacity(0.7),
            fontSize: 24,
          ),
        ),
        tileColor: Colors.white,
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${time.substring(5, 11)}, ${time.substring(0, 3)}', //
              style: TextStyle(
                fontSize: 15,
                color: Color(0xff00114F),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              '${time.substring(17).trim()}',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xff00114F),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
