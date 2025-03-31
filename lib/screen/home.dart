import 'package:flutter/material.dart';
import 'package:balance/pages/balance.dart';
import 'package:balance/pages/task.dart';
import 'package:balance/pages/timer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedPage = 0;
  final _listPages = [BalanceScreen(), TaskScreen(), TimerScreen()];
  final _iconsSize = 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listPages[_selectedPage],
      backgroundColor: Colors.white,
      bottomNavigationBar: _buildBottomNavigationBar,
    );
  }

  get _buildBottomNavigationBar => BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          _selectedPage == 0 ? 'assets/bank-2.svg' : 'assets/bank-1.svg',
          width: _iconsSize,
          height: _iconsSize,
        ),

        label: 'Balance',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          _selectedPage == 1 ? 'assets/task-2.svg' : 'assets/task-1.svg',
          width: _iconsSize,
          height: _iconsSize,
        ),
        label: 'Task',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          _selectedPage == 2 ? 'assets/timer-2.svg' : 'assets/timer-1.svg',
          width: _iconsSize,
          height: _iconsSize,
        ),
        label: 'Timer',
      ),
    ],
    currentIndex: _selectedPage,
    onTap: (index) {
      setState(() {
        _selectedPage = index;
      });
    },
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.black,
    selectedLabelStyle: TextStyle(fontSize: 13.0, fontFamily: 'Inter'),
    unselectedLabelStyle: TextStyle(fontSize: 12.0, fontFamily: 'Inter'),
  );
}
