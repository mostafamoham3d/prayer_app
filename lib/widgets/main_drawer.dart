import 'package:flutter/material.dart';
import 'package:prayer_app/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);
  Widget buildListTile(String title, IconData icon, tap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
        ),
      ),
      onTap: tap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'بسم الله',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('الرئيسيه', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('فلتر', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
