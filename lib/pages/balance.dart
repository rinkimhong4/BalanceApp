import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({super.key});

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: const Center(child: Text('Balance Screen Content')),
    );
  }

  Color primaryColor = Color(0xFF3629B7);
  get _appBar => AppBar(
    title: Text(
      'Hi, Kimhong!',
      style: GoogleFonts.inter(
        fontSize: 24,
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
  );

  // get _tabBarApp => TabBar()
}
