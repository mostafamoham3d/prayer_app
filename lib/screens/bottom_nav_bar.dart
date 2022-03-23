import 'package:flutter/material.dart';
import 'package:prayer_app/islamic_icons_icons.dart';
import 'package:prayer_app/screens/finished_screen.dart';
import 'package:prayer_app/screens/tsabeh_records.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int selectedIndex = 0;
  List<Widget> pages = [Tsabe7Records(), FinishedScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(IslamicIcons.allah),
            title: Text('عدد التسبيحات'),
          ),
          BottomNavigationBarItem(
            icon: Icon(IslamicIcons.praying),
            title: Text('عدد الاذكار'),
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
      ),
      body: pages[selectedIndex],
    );
  }
}
