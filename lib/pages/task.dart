import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabBar.length,
      child: Scaffold(appBar: _appBar, body: _bodyApp),
    );
  }
}

Color primaryColor = Color(0xFF3629B7);
get _tabBar => const [
  Tab(icon: Icon(Icons.home), text: 'Home'),
  Tab(icon: Icon(Icons.search), text: 'Search'),
  Tab(icon: Icon(Icons.settings), text: 'Settings'),
];

get _appBar => AppBar(
  title: Text(
    'Hi, Kimhong!',
    style: GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    ),
  ),
  bottom: TabBar(tabs: _tabBar, indicatorColor: Colors.amber),
  centerTitle: true,
  backgroundColor: primaryColor,
  actions: [
    IconButton(
      onPressed: () {},
      icon: SvgPicture.asset('assets/Bell.svg', width: 24, height: 24),
    ),
  ],
);

get _bodyApp => TabBarView(
  children: [
    Column(children: [Text('To-Do')]),
    Column(children: [Text('progress')]),
    Column(children: [Text('completed')]),
  ],
);
