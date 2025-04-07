import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BalanceHeader extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final VoidCallback onBellPressed;
  //final VoidCallback onLeadingPressed;

  const BalanceHeader({
    super.key,
    required this.userName,
    required this.onBellPressed,
    // required this.onLeadingPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: leadingApp,
      title: Text(
        'Hi, $userName!',
        style: GoogleFonts.inter(
          fontSize: 22,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: const Color(0xFF3629B7),
      actions: [
        IconButton(
          onPressed: onBellPressed,
          icon: SvgPicture.asset('assets/Bell.svg', width: 24, height: 24),
        ),
      ],
    );
  }

  @override
  get preferredSize => const Size.fromHeight(kToolbarHeight);
  // Write more for appBar here

  // get leadingApp => IconButton(
  //   onPressed: onLeadingPressed,
  //   icon: const Icon(Icons.menu, color: Colors.white),
  // );
}
