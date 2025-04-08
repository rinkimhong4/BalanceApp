import 'package:flutter/material.dart';
import 'package:balance/widget/balance_header.dart';
import 'package:balance/widget/budget_summary_card.dart';
import 'package:balance/widget/transaction_list.dart';
import 'package:balance/widget/transaction_section.dart';
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
  final List _dBudget = ['\$5000.00', '-\$500.00'];
  final List _colorBudget = [Color(0xFF05a56a), Colors.red];

  final List<Map<String, dynamic>> _transactions = [
    {
      'date': 'Today',
      'items': [
        {
          'title': 'Dinner',
          'datetime': '15/mar/2025 - 5:11am',
          'amount': '-\$10',
          'isIncome': false,
        },
        {
          'title': 'Salary',
          'datetime': '15/mar/2025 - 5:11am',
          'amount': '+\$1000',
          'isIncome': true,
        },
      ],
      'total': '\$1500',
    },
    {
      'date': 'Yesterday',
      'items': [
        {
          'title': 'Coffee',
          'datetime': '14/mar/2025 - 8:45am',
          'amount': '-\$10',
          'isIncome': false,
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: BalanceHeader(
          userName: 'Kimhong',
          // onLeadingPressed: () {},
          onBellPressed: () {},
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(top: 14),
                margin: EdgeInsets.all(16),
                height: 120,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    _titleBudget.length,
                    (index) => BudgetSummaryCard(
                      title: _titleBudget[index],
                      icon: _iconBudget[index],
                      amount: _dBudget[index],
                      color: _colorBudget[index],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: TransactionSection()),
            SliverPersistentHeader(
              delegate: _SliverTabBarDelegate(
                TabBar(
                  indicatorColor: Color(0xFF3629B7),
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Color(0xFF3629B7),
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.all_inbox,
                          color: Color(0xFF05a56a),
                          size: 18,
                        ),
                        SizedBox(width: 4),
                        Tab(
                          child: Text(
                            'All',
                            style: GoogleFonts.inter(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_circle_up_sharp,
                            color: Color(0xFF05a56a),
                            size: 18,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Income',
                            style: GoogleFonts.inter(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_circle_down_sharp,
                            color: Colors.red,
                            size: 18,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Expense',
                            style: GoogleFonts.inter(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Color(0xFF3629B7),
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  TransactionList(
                    transactions: _transactions,
                    incomeColor: Color(0xFF05a56a),
                    expenseColor: Colors.red,
                    transactionType: 'All',
                  ),
                  TransactionList(
                    transactions: _transactions,
                    incomeColor: Color(0xFF05a56a),
                    expenseColor: Colors.red,
                    transactionType: 'Income',
                  ),
                  TransactionList(
                    transactions: _transactions,
                    incomeColor: Color(0xFF05a56a),
                    expenseColor: Colors.red,
                    transactionType: 'Expense',
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xFF3629B7),
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverTabBarDelegate(this._tabBar, this.primaryColor);

  final TabBar _tabBar;
  final Color primaryColor;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: primaryColor.withAlpha(5), child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) => false;
}
