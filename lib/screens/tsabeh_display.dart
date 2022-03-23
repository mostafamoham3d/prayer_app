import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayer_app/models/azkar.dart';
import 'package:prayer_app/models/data.dart';

class TsabehDisplayScreen extends StatefulWidget {
  static const routeName = 'tsabeh_display';
  const TsabehDisplayScreen({Key? key}) : super(key: key);

  @override
  _TsabehDisplayScreenState createState() => _TsabehDisplayScreenState();
}

class _TsabehDisplayScreenState extends State<TsabehDisplayScreen> {
  void toggleFavorites(String tsbehBody, int noOfReadings) {
    final existingIndex =
        finishedTsabe7.indexWhere((tsabeh) => tsbehBody == tsabeh.body);
    Tsabeh2 tsabeh2 = Tsabeh2(tsbehBody, noOfReadings);
    if (existingIndex == -1) {
      setState(() {
        finishedTsabe7.add(tsabeh2);
      });
    } else {
      setState(() {
        finishedTsabe7.removeAt(existingIndex);
        finishedTsabe7.add(tsabeh2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context)!.settings.arguments as Map;
    final String tsabehId = routeArg['id'];
    var tsabehlist =
        dummyTsabe7.firstWhere((element) => element.id == tsabehId);
    return Scaffold(
      appBar: AppBar(
        title: Text('تسبيح'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(20),
                // color: Color.fromRGBO(255, 254, 229, 1),
              ),
              child: Center(
                child: Text(tsabehlist.body),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            FlatButton(
              //splashColor: Colors.transparent,
              //highlightColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {
                setState(() {
                  tsabehlist.noOfReadings++;
                  toggleFavorites(tsabehlist.body, tsabehlist.noOfReadings);
                });
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).buttonColor,
                  shape: BoxShape.circle,
                  //border: Border.all(color: Colors.blue, width: 5),
                  //color: Color.fromRGBO(255, 254, 229, 0.7),
                ),
                child: Center(
                  child: Text('${tsabehlist.noOfReadings}',
                      style: TextStyle(color: Theme.of(context).cardColor)),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    tsabehlist.noOfReadings = 0;
                    toggleFavorites(tsabehlist.body, tsabehlist.noOfReadings);
                  });
                },
                icon: Icon(Icons.restart_alt))
          ],
        ),
      ),
    );
  }
}
