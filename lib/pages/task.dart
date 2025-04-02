import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final Color primaryColor = const Color(0xFF3629B7);
  final double _titleSize = 22;
  final double _tabFontSize = 14.0;
  final double _unselectedTabFontSize = 12.0;

  //String _selectedTabBar = 'todo';

  List<Widget> _buildTabBar() {
    return [
      Tab(child: Text('To-Do', style: TextStyle(fontSize: _tabFontSize))),
      Tab(child: Text('Progress', style: TextStyle(fontSize: _tabFontSize))),
      Tab(child: Text('Completed', style: TextStyle(fontSize: _tabFontSize))),
    ];
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'Hi, Kimhong!',
        style: GoogleFonts.inter(
          fontSize: _titleSize,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
      ),
      bottom: TabBar(
        tabs: _buildTabBar(),
        labelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.values.first,
        indicatorColor: Colors.white,
        unselectedLabelColor: Colors.white60,
        unselectedLabelStyle: TextStyle(fontSize: _unselectedTabFontSize),
      ),
      centerTitle: true,
      backgroundColor: primaryColor,
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/Bell.svg', width: 24, height: 24),
        ),
      ],
    );
  }

  Widget _buildBodyApp() {
    return const TabBarView(
      children: [
        Center(child: Text('To-Do')),
        Center(child: Text('Progress')),
        Center(child: Text('Completed')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _buildTabBar().length,
      child: Scaffold(appBar: _buildAppBar(), body: _buildBodyApp()),
    );
  }
}
