import 'package:balance/widget/bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:balance/pages/balance.dart';
import 'package:balance/pages/task.dart';
import 'package:balance/pages/timer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedPage = 0;
  final _listPages = [BalanceScreen(), TaskScreen(), TimerScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listPages[_selectedPage],
      bottomNavigationBar: BottomNavigationbarWidge(
        selectedIndex: _selectedPage,
        onItemTapped: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
      ),
    );
  }
}
