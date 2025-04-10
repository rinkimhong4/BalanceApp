import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:balance/widget/balance_header.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _appBar,
        body: _buildBodyApp(context),
        floatingActionButton: _buildFloatingActionButton(context),
      ),
    );
  }
}

Widget _buildFloatingActionButton(BuildContext context) {
  return FloatingActionButton.extended(
    backgroundColor: primaryColor,
    onPressed: () {},
    label: const Text('Alarm', style: TextStyle(color: Colors.white)),
    icon: const Icon(Icons.timer, color: Colors.white),
  );
}

const Color primaryColor = Color(0xFF3629B7);
const double _tabFontSize = 16.0;
const double _unselectedTabFontSize = 15.0;

PreferredSizeWidget get _appBar => AppBar(
  title: BalanceHeader(userName: 'Kimhong', onBellPressed: () {}),

  centerTitle: true,
  backgroundColor: primaryColor,
  actions: [
    IconButton(
      onPressed: () {},
      icon: SvgPicture.asset('assets/Bell.svg', width: 24, height: 24),
    ),
  ],
  bottom: TabBar(
    labelColor: Colors.white,
    indicatorSize: TabBarIndicatorSize.tab,
    indicatorColor: Colors.white,
    unselectedLabelColor: Colors.white60,
    labelStyle: TextStyle(fontSize: _tabFontSize),
    unselectedLabelStyle: TextStyle(fontSize: _unselectedTabFontSize),
    tabs: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.timer_sharp, color: Colors.white, size: 18),
          SizedBox(width: 14),

          Tab(text: 'Timer'),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.alarm, color: Colors.white, size: 18),
          SizedBox(width: 14),
          Tab(text: 'Alarm'),
        ],
      ),
    ],
  ),
);

Widget _buildBodyApp(BuildContext context) {
  return Center(
    child: Column(
      children: [
        Flexible(
          child: TabBarView(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 250,
                    width: 250,
                    child: CircularProgressIndicator(
                      value: 1,
                      strokeWidth: 4,
                      color: primaryColor.withAlpha(100),
                      backgroundColor: Colors.grey.shade200,
                    ),
                  ),
                  Text(
                    "30:00",
                    style: GoogleFonts.inter(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Positioned(
                    top: 350,
                    child: Text(
                      "Ready",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.play_circle_outline,
                        size: 80,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 50,
                    bottom: 65,
                    child: IconButton(
                      onPressed: () {},

                      icon: SvgPicture.asset(
                        'assets/skip-next.svg',
                        width: 45,
                        height: 45,
                        colorFilter: ColorFilter.mode(
                          primaryColor.withAlpha(60),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 50,
                    bottom: 65,
                    child: IconButton(
                      onPressed: () {},

                      icon: SvgPicture.asset(
                        'assets/loop.svg',
                        width: 50,
                        height: 50,
                        colorFilter: ColorFilter.mode(
                          primaryColor.withAlpha(60),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ListView(
                children: [
                  _buildAlarmItem("7:00 AM", "Wake up", primaryColor),
                  _buildAlarmItem("8:00 AM", "Breakfast", Colors.orange),
                  _buildAlarmItem("11:00 PM", "Lunch Break", Colors.green),
                  _buildAlarmItem("12:45 PM", "Go to school", Colors.amber),
                  _buildAlarmItem("6:00 PM", "Dinner Time", Colors.red),
                  _buildAlarmItem(
                    "6:00 PM",
                    "Online class",
                    Colors.deepPurpleAccent,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildAlarmItem(String time, String label, Color color) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: primaryColor.withValues(alpha: 10),
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withValues(alpha: 0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.grey.withValues(alpha: 60),
              ),
            ),
          ],
        ),
        Switch(value: true, onChanged: (value) {}, activeColor: color),
      ],
    ),
  );
}
