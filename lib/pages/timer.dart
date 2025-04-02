import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(appBar: _appBar, body: _buildBodyApp()),
    );
  }
}

const Color primaryColor = Color(0xFF3629B7);
const double _titleSize = 22;
const double _tabFontSize = 14.0;
const double _unselectedTabFontSize = 12.0;

PreferredSizeWidget get _appBar => AppBar(
  title: Text(
    'Hi, Kimhong!',
    style: GoogleFonts.inter(
      fontSize: _titleSize,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    ),
  ),
  centerTitle: true,
  backgroundColor: primaryColor,
  actions: [
    IconButton(
      onPressed: () {},
      icon: SvgPicture.asset('assets/Bell.svg', width: 24, height: 24),
    ),
  ],
  bottom: const TabBar(
    labelColor: Colors.white,
    indicatorColor: Colors.white,
    unselectedLabelColor: Colors.white60,
    labelStyle: TextStyle(fontSize: _tabFontSize),
    unselectedLabelStyle: TextStyle(fontSize: _unselectedTabFontSize),
    tabs: [Tab(text: 'Timer'), Tab(text: 'Alarm')],
  ),
);

Widget _buildBodyApp() {
  return const TabBarView(
    children: [
      Center(child: Text('Timer Content')),
      Center(child: Text('Alarm Content')),
    ],
  );
}
