import 'package:flutter/material.dart';
import 'package:prayer_app/models/data.dart';

class FinishedScreen extends StatefulWidget {
  static const routeName = 'finished_screen';

  @override
  _FinishedScreenState createState() => _FinishedScreenState();
}

class _FinishedScreenState extends State<FinishedScreen> {
  Widget buildBody() {
    if (finishedList.isEmpty) {
      return Center(
        child: Container(
          child: Text('لا يوجد شئ'),
        ),
      );
    } else {
      return ListView(
        children: finishedList.map((e) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // color: Color.fromRGBO(255, 254, 229, 1),
                ),
                child: Text(e),
              ),
            ),
          );
        }).toList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: finishedList.isEmpty
            ? Center(
                child: Container(
                  color: Theme.of(context).backgroundColor,
                  child: Text('لا يوجد شئ'),
                ),
              )
            : ListView(
                children: finishedList.map((e) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.circular(15),
                          // color: Color.fromRGBO(255, 254, 229, 1),
                        ),
                        child: Text(e),
                      ),
                    ),
                  );
                }).toList(),
              ));
  }
}
