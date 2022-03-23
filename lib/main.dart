import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:prayer_app/models/azkar.dart';
import 'package:prayer_app/models/data.dart';
import 'package:prayer_app/screens/finished_screen.dart';
import 'package:prayer_app/screens/main_screen.dart';
import 'package:prayer_app/screens/msa_screen.dart';
import 'package:prayer_app/screens/sbah_screen.dart';
import 'package:prayer_app/screens/tsabeh_display.dart';
import 'package:prayer_app/screens/tsabeh_records.dart';
import 'package:prayer_app/screens/tsabeh_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Azkar> selectedList = dummyAzkar;

  Map<String, bool> _filters = {
    'msa2': false,
    'sba7': false,
  };

  void setFilters(Map<String, bool> filters) {
    setState(() {
      _filters = filters;
      selectedList = dummyAzkar.where((element) {
        if (_filters['msa2'] == true && !element.isMsa2) {
          return false;
        }
        if (_filters['sba7'] == true && !element.isSbah) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: FlexColorScheme.light(scheme: FlexScheme.damask).toTheme,
      //home: MyHomePage(),
      routes: {
        MainScreen.routeName: (context) => MainScreen(),
        SbahScreen.routeName: (context) => SbahScreen(),
        Msa2Screen.routeName: (context) => Msa2Screen(),
        TsabehScreen.routeName: (context) => TsabehScreen(),
        TsabehDisplayScreen.routeName: (context) => TsabehDisplayScreen(),
        FinishedScreen.routeName: (context) => FinishedScreen(),
        Tsabe7Records.routeName: (context) => Tsabe7Records(),
      },
      initialRoute: MainScreen.routeName,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Prayer app'),
      ),
      body: null,
    );
  }
}
