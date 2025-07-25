// lib/pages/home/home_page.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/widget/bottomtabbar_custom.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  _StudentListScreenState createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Quay lại màn hình trước đó
          },
        ),
        title: Text(
          'Danh sách sinh viên',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Tất cả',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Mã sinh viên',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          context.goNamed('feature');
                        },
                        child: ListView(
                          children: [
                            StudentCard(
                              name: 'Nguyễn Phú Xuân Thảo',
                              studentId: '72DCHT20030',
                            ),
                            StudentCard(
                              name: 'Sách nghệ văn lớp 6 tập 2',
                              studentId: '72DCHT20004',
                            ),
                            StudentCard(
                              name: 'Nguyễn Đình Minh',
                              studentId: '72DCHT20033',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Thêm sinh viên',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomTabBarWidget(
        tabController: _tabController,
        onTabChanged: _handleTabChange,
      ),
    );
  }
}

class StudentCard extends StatelessWidget {
  final String name;
  final String studentId;

  const StudentCard({super.key, required this.name, required this.studentId});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(name),
        subtitle: Text('Mã sinh viên: $studentId'),
      ),
    );
  }
}
