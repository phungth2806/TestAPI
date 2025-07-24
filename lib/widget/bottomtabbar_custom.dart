import 'package:flutter/material.dart';

class BottomTabBarWidget extends StatelessWidget {
  final TabController tabController;
  final Function(int) onTabChanged;

  const BottomTabBarWidget(
      {super.key, required this.tabController, required this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: TabBar(
        controller: tabController,
        onTap: onTabChanged,
        tabs: [
          Tab(icon: Icon(Icons.home), text: 'Home'),
          Tab(icon: Icon(Icons.person), text: 'Profile'),
          Tab(icon: Icon(Icons.settings), text: 'Settings'),
          Tab(icon: Icon(Icons.notifications), text: 'Notifications'),
        ],
        labelColor: Colors.blue,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.blue,
      ),
    );
  }
}
