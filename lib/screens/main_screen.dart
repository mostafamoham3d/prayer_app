import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayer_app/islamic_icons_icons.dart';
import 'package:prayer_app/screens/bottom_nav_bar.dart';
import 'package:prayer_app/screens/msa_screen.dart';
import 'package:prayer_app/screens/sbah_screen.dart';
import 'package:prayer_app/screens/tsabeh_screen.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/';
  const MainScreen({Key? key}) : super(key: key);
  Widget buildButton(
      BuildContext ctx, String route, IconData iconData, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Card(
        color: Color(0xFFFFE1AB99),
        elevation: 10,
        shadowColor: Color(0xFFFFC96646),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          horizontalTitleGap: 150,
          title: Text(
            title,
            style: TextStyle(fontSize: 24),
          ),
          leading: Icon(iconData),
          onTap: () {
            Navigator.of(ctx).pushNamed(route);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [Text('الرئيسيه'), Text('الاحصائيات')],
            ),
            title: Text('Prayer App'),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildButton(context, SbahScreen.routeName,
                          IslamicIcons.praying__1_, 'اذكار الصباح '),
                      buildButton(context, Msa2Screen.routeName,
                          IslamicIcons.praying, 'اذكار المساء '),
                      buildButton(context, TsabehScreen.routeName,
                          IslamicIcons.allah, 'تسبيح'),
                    ],
                  ),
                ),
              ),
              BottomNavigationScreen()
            ],
          )),
    );
  }
}
