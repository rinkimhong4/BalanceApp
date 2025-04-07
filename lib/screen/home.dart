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
  final double _iconsSize = 24.0;
  final _listPages = [BalanceScreen(), TaskScreen(), TimerScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listPages[_selectedPage],
      backgroundColor: Colors.white,
      bottomNavigationBar: _buildBottomNavigationBar,
    );
  }

  Color primaryColor = Color(0xFF3629B7);

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
    elevation: 0,
    backgroundColor: primaryColor.withAlpha(15),
    currentIndex: _selectedPage,
    onTap: (index) {
      setState(() {
        _selectedPage = index;
      });
    },
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: const TextStyle(fontSize: 13.0, fontFamily: 'Inter'),
    unselectedLabelStyle: const TextStyle(
      fontSize: 12.0,
      fontFamily: 'Inter',
      color: Colors.grey,
    ),
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.grey,
  );
}
