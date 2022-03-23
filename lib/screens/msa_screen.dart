import 'package:flutter/material.dart';
import 'package:prayer_app/models/azkar.dart';
import 'package:prayer_app/models/data.dart';
import 'package:prayer_app/widgets/azkar_item.dart';

class Msa2Screen extends StatefulWidget {
  static const routeName = 'msa2_screen';
  const Msa2Screen({Key? key}) : super(key: key);

  @override
  _Msa2ScreenState createState() => _Msa2ScreenState();
}

class _Msa2ScreenState extends State<Msa2Screen> {
  BoxDecoration standardDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    // color: Colors.grey,
  );
  BoxDecoration doneDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      // color: Colors.grey,
      border: Border.all(
        // color: Colors.black54,
        width: 3,
      ));
  List<Azkar> msa2List = dummyMsa2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اذكار المساء'),
      ),
      body: AzkarItem(msa2List, standardDecoration, doneDecoration),
    );
  }
}
