import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(appBar: _appBar, body: _buildBodyApp(context)),
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
    indicatorSize: TabBarIndicatorSize.tab,
    indicatorColor: Colors.white,
    unselectedLabelColor: Colors.white60,
    labelStyle: TextStyle(fontSize: _tabFontSize),
    unselectedLabelStyle: TextStyle(fontSize: _unselectedTabFontSize),
    tabs: [Tab(text: 'Timer'), Tab(text: 'Alarm')],
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
                  Padding(
                    padding: const EdgeInsets.only(top: 160),
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
                        colorFilter: ColorFilter.mode(
                          primaryColor.withValues(alpha: 60),
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
                        colorFilter: ColorFilter.mode(
                          primaryColor.withValues(alpha: 60),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Center(child: Text("Alarm", style: GoogleFonts.inter())),
            ],
          ),
        ),
      ],
    ),
  );
}
