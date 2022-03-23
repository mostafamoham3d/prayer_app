import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayer_app/models/data.dart';

class Tsabe7Records extends StatefulWidget {
  static const routeName = 'tsabeh_rec';
  @override
  _Tsabe7RecordsState createState() => _Tsabe7RecordsState();
}

class _Tsabe7RecordsState extends State<Tsabe7Records> {
  Widget buildBody() {
    if (finishedTsabe7.isEmpty) {
      return Center(
        child: Container(
          child: Text('لا يوجد شئ'),
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: finishedTsabe7.map((e) {
            return Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          // color: Color.fromRGBO(255, 254, 229, 1),
                        ),
                        child: Center(
                          child: Text(e.body),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Container(
                          child: Text('${e.count}'),
                        ),
                      ),
                    )
                  ],
                ));
          }).toList(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: finishedTsabe7.isEmpty
          ? Center(
              child: Container(
                color: Theme.of(context).backgroundColor,
                child: Text('لا يوجد شئ'),
              ),
            )
          : Padding(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: finishedTsabe7.map((e) {
                  return Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColorLight,
                                borderRadius: BorderRadius.circular(15),
                                // color: Color.fromRGBO(255, 254, 229, 1),
                              ),
                              child: Center(
                                child: Text(e.body),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Theme.of(context).primaryColorLight,
                                ),
                                child: Center(
                                  child: Text('${e.count}'),
                                ),
                              ),
                            ),
                          )
                        ],
                      ));
                }).toList(),
              ),
            ),
    );
  }
}
