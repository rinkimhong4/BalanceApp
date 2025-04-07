import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({super.key});

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  final List _titleBudget = ['Income', 'Expense'];
  final List _iconBudget = [
    Icons.arrow_circle_up_sharp,
    Icons.arrow_circle_down_sharp,
  ];
  final List _dBudget = ['\$50,000.00', '\$1,000.00'];
  final List _colorBudget = [const Color(0xFF05a56a), Colors.red];
  final Color primaryColor = const Color(0xFF3629B7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar, body: _buildBody);
  }

  get _appBar => AppBar(
    title: Text(
      'Hi, Kimhong!',
      style: GoogleFonts.inter(
        fontSize: 22,
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

  get _buildBody => Container(
    padding: const EdgeInsets.only(top: 16),
    margin: const EdgeInsets.all(16),
    height: 130,
    width: double.infinity,
    decoration: BoxDecoration(
      //color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        _titleBudget.length,
        (index) => Container(
          padding: const EdgeInsets.all(16),
          width: 140,
          decoration: BoxDecoration(
            color: _colorBudget[index].withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(_iconBudget[index], color: _colorBudget[index]),
                  const SizedBox(width: 5),
                  Text(
                    _titleBudget[index],
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: _colorBudget[index],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _dBudget[index],
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: _colorBudget[index],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );

  get _tabBarBottom => TabBar(
    indicatorColor: primaryColor,
    labelColor: primaryColor,
    unselectedLabelColor: Colors.black,
    tabs: const [Tab(text: 'All'), Tab(text: 'Income'), Tab(text: 'Expense')],
  );
}
