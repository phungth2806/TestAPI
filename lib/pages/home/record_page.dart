import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThongTinSinhVienScreen extends StatelessWidget {
  const ThongTinSinhVienScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBB714),
        automaticallyImplyLeading: false,
        toolbarHeight: 55,
        titleSpacing: 0,
        title: Row(
          children: [
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset("assets/img/back-svgrepo-com.svg", height: 25),
            ),
            const SizedBox(width: 10),
            const Text(
              'Thông tin sinh viên',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFF8F8FA),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  children: const [
                    InfoNormal(),
                    InfoBlock(
                      title: "THÔNG TIN CHI TIẾT",
                      data: {
                        "Mã sinh viên": "211121514147",
                        "Email": "yphuong03@gmail.com",
                        "Số điện thoại": "0915199506",
                        "Ngày sinh": "14/03/2003",
                        "Địa chỉ": "32 Nguyễn Xiển, Ngũ Hành Sơn, Đà Nẵng",
                      },
                    ),
                    InfoBlock(
                      title: "THÔNG TIN PHỤ HUYNH",
                      data: {
                        "Tên cha": "Nguyễn Ngọc Lý",
                        "Tên mẹ": "Đặng Thị Kim Anh",
                      },
                    ),
                    SizedBox(height: 20),
                    SoDoTron(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: const Color(0xFFFBB714),
      child: Row(
        children: [
          SvgPicture.asset("assets/img/back-svgrepo-com.svg", height: 25),
          const SizedBox(width: 10),
          const Text(
            'Thông tin sinh viên',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFF8F8FA),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class InfoNormal extends StatelessWidget {
  const InfoNormal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nguyễn Ý Phương",
                  style: TextStyle(fontSize: 20, color: Color(0xFF333333))),
              Text("Lớp: 47K14", style: TextStyle(color: Color(0xFF333333))),
            ],
          ),
        ],
      ),
    );
  }
}

class InfoBlock extends StatelessWidget {
  final String title;
  final Map<String, String> data;

  const InfoBlock({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF333333),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),

              ],
            ),
          ),
          const SizedBox(height: 10),
          ...data.entries.map((entry) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 120,
                    child: Text('${entry.key}:',
                        style: const TextStyle(fontWeight: FontWeight.w500))),
                Expanded(child: Text(entry.value)),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class SoDoTron extends StatelessWidget {
  const SoDoTron({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          CircleInfo(
            value: "146",
            label: "Tổng số tín chỉ",
            color: Color(0xFF005EA3),
          ),
          CircleInfo(
            value: "3.43",
            label: "GPA",
            color: Color(0xFF058E47),
          ),
        ],
      ),
    );
  }
}

class CircleInfo extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const CircleInfo(
      {super.key, required this.value, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 4),
          ),
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}