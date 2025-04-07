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
  final List _dBudget = ['\$500.00', '-\$5000.00'];
  final List _colorBudget = [const Color(0xFF05a56a), Colors.red];
  final Color primaryColor = const Color(0xFF3629B7);

  // Sample transaction data
  final List<Map<String, dynamic>> _transactions = [
    {
      'date': 'Today',
      'items': [
        {
          'title': 'Dinner',
          'datetime': '15/mar/2025-5:11am',
          'amount': '-\$10',
        },
        {
          'title': 'Salary',
          'datetime': '15/mar/2025-5:11am',
          'amount': '+\$1000',
        },
      ],
      'total': '\$1500',
    },
    {
      'date': 'Yesterday',
      'items': [
        {
          'title': 'Coffee',
          'datetime': '15/mar/2025-5:11am',
          'amount': '-\$10',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _appBar,
        body: _builBody,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.orange,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  get _builBody => CustomScrollView(
    slivers: [
      SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.only(top: 16),
          margin: const EdgeInsets.all(16),
          height: 130,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              _titleBudget.length,
              (index) => Container(
                padding: const EdgeInsets.all(16),
                width: 150,
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
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Recent transactions',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ),
      SliverToBoxAdapter(child: _tabBarBottom),
      SliverFillRemaining(
        child: TabBarView(
          children: [
            ///==================================
          ],
        ),
      ),
    ],
  );

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

  get _tabBarBottom => TabBar(
    indicatorColor: primaryColor,
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: primaryColor,
    unselectedLabelColor: Colors.black,
    tabs: [
      Tab(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('All', style: GoogleFonts.inter(fontSize: 14))],
        ),
      ),
      Tab(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_circle_up_sharp, size: 14, color: _colorBudget[0]),
            const SizedBox(width: 8),
            Text('Income', style: GoogleFonts.inter(fontSize: 14)),
          ],
        ),
      ),
      Tab(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.arrow_circle_down_sharp,
              size: 14,
              color: _colorBudget[1],
            ),
            const SizedBox(width: 8),
            Text('Expense', style: GoogleFonts.inter(fontSize: 14)),
          ],
        ),
      ),
    ],
  );
}
