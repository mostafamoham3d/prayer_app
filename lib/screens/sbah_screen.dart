import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayer_app/models/azkar.dart';
import 'package:prayer_app/models/data.dart';
import 'package:prayer_app/widgets/azkar_item.dart';

class SbahScreen extends StatefulWidget {
  static const routeName = 'sbah_screen';
  @override
  _SbahScreenState createState() => _SbahScreenState();
}

class _SbahScreenState extends State<SbahScreen> {
  List<Azkar> sbahList = dummySbah;
  BoxDecoration standardDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    //  color: Colors.grey,
  );
  BoxDecoration doneDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      //  color: Colors.grey,
      border: Border.all(
        //  color: Colors.black54,
        width: 3,
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('الاذكار '),
        ),
        body: AzkarItem(sbahList, standardDecoration, doneDecoration));
  }
}
