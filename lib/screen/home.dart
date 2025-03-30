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
      appBar: AppBar(title: const Text('hi'), centerTitle: true),
      body: _listPages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              _selectedPage == 0
                  ? Icons.account_balance
                  : Icons.account_balance_outlined,
            ),
            label: 'Balance',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedPage == 1 ? Icons.task : Icons.task_outlined),
            label: 'Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedPage == 2 ? Icons.timer : Icons.timer_outlined),
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
        selectedItemColor: Color(0xFFFF7622),
        unselectedItemColor: Colors.black,
        backgroundColor: const Color(0xFFF2F8FC),
      ),
    );
  }
}
