import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar);
  }
}

Color primaryColor = Color(0xFF3629B7);

get _appBar => AppBar(
  title: Text(
    'Tasks',
    style: GoogleFonts.inter(
      fontSize: 28,
      fontWeight: FontWeight.w400,
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
);
