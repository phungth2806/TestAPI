import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/widget/bottomtabbar_custom.dart';
import 'feature_page.dart';


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
      backgroundColor: const Color(0xFFF8F8FA),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: AppBar(
          backgroundColor: const Color(0xFFFBB714),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Danh sách sinh viên',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 60, left: 15, right: 15),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Expanded(
                child: ListView(
                  children: const [
                    StudentCard(
                      name: 'Nguyễn Ý Phương',
                      studentId: '211121514147',
                    ),
                    StudentCard(
                      name: 'Nguyễn Phú Xuân Thảo',
                      studentId: '211121514148',
                    ),
                    StudentCard(
                      name: 'Nguyễn Đình Minh',
                      studentId: '211121514150',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: const Color(0xFFFBB714),
      //   onPressed: () {},
      //   tooltip: 'Thêm sinh viên',
      //   child: const Icon(Icons.add, color: Colors.white),
      // ),
      bottomNavigationBar: BottomTabBarWidget(
        tabController: _tabController,
        onTabChanged: _handleTabChange,
      ),
    );
  }
}
// bat su kien chuyen trang
class StudentCard extends StatelessWidget {
  final String name;
  final String studentId;

  const StudentCard({super.key, required this.name, required this.studentId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (name == 'Nguyễn Ý Phương') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/img/avatar-trang-4.jpg',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF333333),
                  ),
                ),
                Text(
                  'Mã sinh viên: $studentId',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF333333),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


