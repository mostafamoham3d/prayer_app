import 'package:flutter/material.dart';
import 'package:prayer_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = 'filters';
  final setFilters;
  final Map<String, bool> filter;
  FilterScreen(this.setFilters, this.filter);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  Widget getSwitchList(String title, onTap, bool currentValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      onChanged: onTap,
    );
  }

  bool isSba7 = false;
  bool isMsa2 = false;
  @override
  void initState() {
    isSba7 = widget.filter['sba7'] ?? false;
    isMsa2 = widget.filter['msa2'] ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Favorites'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedZekr = {
                'msa2': isMsa2,
                'sba7': isSba7,
              };
              widget.setFilters(selectedZekr);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                getSwitchList('اذكار المساء', (value) {
                  setState(() {
                    isMsa2 = value;
                  });
                }, isMsa2),
                getSwitchList('اذكار الصباح', (value) {
                  setState(() {
                    isSba7 = value;
                  });
                }, isSba7),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
