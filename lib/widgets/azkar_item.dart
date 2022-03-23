import 'package:flutter/material.dart';
import 'package:prayer_app/models/azkar.dart';
import 'package:prayer_app/models/data.dart';

class AzkarItem extends StatefulWidget {
  List<Azkar> listAzk;
  BoxDecoration stdDecoration;
  BoxDecoration finishedDecoration;
  AzkarItem(this.listAzk, this.stdDecoration, this.finishedDecoration);
  @override
  _AzkarItemState createState() => _AzkarItemState();
}

class _AzkarItemState extends State<AzkarItem> {
  void toggleFavorites(String zekrBody) {
    final existingIndex = finishedList.indexWhere((zekr) => zekrBody == zekr);
    if (existingIndex == -1) {
      setState(() {
        finishedList.add(zekrBody);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    splashColor: Theme.of(context).splashColor,
                    highlightColor: Theme.of(context).highlightColor,
                    onPressed: () {
                      setState(() {
                        if (widget.listAzk[index].noOfReading > 0) {
                          setState(() {
                            widget.listAzk[index].noOfReading--;
                          });
                        }
                        if (widget.listAzk[index].noOfReading == 0) {
                          setState(() {
                            String body;
                            body = widget.listAzk[index].body;
                            toggleFavorites(body);
                          });
                        }
                      });
                    },
                    child: Container(
                      decoration: widget.listAzk[index].noOfReading > 0
                          ? BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius: BorderRadius.circular(15),
                              // color: Colors.grey,
                            )
                          : BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius: BorderRadius.circular(15),
                              // color: Colors.grey,
                              border: Border.all(
                                // color: Colors.black54,
                                width: 3,
                              )),
                      padding: EdgeInsets.all(20),
                      child: Text(
                        widget.listAzk[index].body,
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyText1!.color),
                      ),
                    ),
                  ),
                  Text('التكرار:${widget.listAzk[index].noOfReading} مره')
                ],
              ),
            );
          },
          itemCount: widget.listAzk.length,
        ),
      ),
    );
  }
}
