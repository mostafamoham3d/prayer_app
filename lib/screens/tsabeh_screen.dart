import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayer_app/models/azkar.dart';
import 'package:prayer_app/models/data.dart';
import 'package:prayer_app/screens/tsabeh_display.dart';

class TsabehScreen extends StatefulWidget {
  static const routeName = 'tsabeh_screen';
  const TsabehScreen({Key? key}) : super(key: key);

  @override
  _TsabehScreenState createState() => _TsabehScreenState();
}

class _TsabehScreenState extends State<TsabehScreen> {
  List<Tsabeh> tsabehList = dummyTsabe7;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تسبيح'),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: tsabehList.map((value) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(TsabehDisplayScreen.routeName,
                    arguments: {'id': value.id});
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(15),
                  //color: Color.fromRGBO(255, 254, 229, 1),
                ),
                child: Center(
                  child: Text(
                    value.body,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
