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

  String _selectedTab = 'progress';
  final _tasks = [
    Task(title: 'Reading Book', isCompleted: false),
    Task(title: 'Clean room', isCompleted: true),
    Task(title: 'Do Homework', isCompleted: false),
    Task(title: 'Running', isCompleted: false),
    Task(title: 'Reading Book', isCompleted: false),
    Task(title: 'Clean room', isCompleted: true),
    Task(title: 'Do Homework', isCompleted: false),
    Task(title: 'Running', isCompleted: false),
    Task(title: 'Reading Book', isCompleted: false),
    Task(title: 'Clean room', isCompleted: true),
    Task(title: 'Do Homework', isCompleted: false),
    Task(title: 'Running', isCompleted: false),
    Task(title: 'Clean ', isCompleted: true),
    Task(title: 'Clean room', isCompleted: true),
    Task(title: 'Clean room', isCompleted: true),
    Task(title: 'Clean rroom', isCompleted: true),
  ];

  get _filteredTasks =>
      _selectedTab == 'progress'
          ? _tasks.where((task) => !task.isCompleted).toList()
          : _tasks.where((task) => task.isCompleted).toList();

  get tabBarWidgets => [
    Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.radio_button_unchecked),
          SizedBox(width: 5),
          Text('Progress', style: TextStyle(fontSize: _tabFontSize)),
        ],
      ),
    ),
    Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle),
          SizedBox(width: 5),
          Text('Completed', style: TextStyle(fontSize: _tabFontSize)),
        ],
      ),
    ),
  ];

  get bodyApp => TabBarView(
    children: [
      _buildTaskList(context, 'progress'),
      _buildTaskList(context, 'completed'),
    ],
  );

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
        onTap:
            (index) => setState(
              () => _selectedTab = index == 0 ? 'progress' : 'completed',
            ),
        tabs: tabBarWidgets,
        labelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
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

  Widget _buildTaskList(BuildContext context, String tab) {
    _selectedTab = tab;
    List<Task> tasks = _filteredTasks;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => TaskItem(task: tasks[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabBarWidgets.length,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: bodyApp,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: primaryColor,
          onPressed: null,
          label: const Text('Add New', style: TextStyle(color: Colors.white)),
          icon: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}

class Task {
  String title;
  bool isCompleted;
  Task({required this.title, required this.isCompleted});
}

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: const [
                    Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                    Text(
                      'Mar,03,2025  ',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Icon(Icons.access_time, size: 14, color: Colors.grey),
                    Text(
                      '12:12 AM',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SingleChildScrollView(
              child: Row(
                children: [
                  Icon(
                    task.isCompleted
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color: task.isCompleted ? Colors.green : Colors.grey,
                  ),
                  const SizedBox(width: 14),
                  Icon(Icons.delete, color: Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
