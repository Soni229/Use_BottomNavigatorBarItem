import 'package:flutter/material.dart';
import 'gratitude.dart';
import 'reminders.dart';
import 'birthdays.dart';

void main(List<String> args) {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Bar",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ClasseHome());
  }
}

class ClasseHome extends StatefulWidget {
  @override
  _ClasseHomeState createState() => _ClasseHomeState();
}

class _ClasseHomeState extends State<ClasseHome> {
  int _currentIndex = 0;
  List _listPages = [];
  Widget? _currentPage;
  @override
  void initState() {
    super.initState();
    _listPages..add(Birthdays())..add(Gratitude())..add(Reminders());
    _currentPage = Birthdays();
  }

  void _changePage(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _listPages[selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(padding: EdgeInsets.all(13.0), child: _currentPage),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            label: 'Birthdays',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sentiment_satisfied),
            label: 'Gratitude',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            label: 'Reminders',
          ),
        ],
        onTap: (selectedIndex) => _changePage(selectedIndex),
      ),
    );
  }
}
