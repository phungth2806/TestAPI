import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'record_page.dart'; // <-- Đặt đúng tên file chứa trang Hồ sơ

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea( // Đảm bảo không bị lấn status bar
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F8FA),
        body: Column(
          children: const [
            HeaderBar(),
            Expanded(child: MainContent()),
            // FooterBar(), // Có thể mở nếu cần
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
      color: const Color(0xFFFBB714),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      height: 55,
      child: Row(
        children: [
          SvgPicture.asset('assets/img/back-svgrepo-com.svg', height: 30),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm...',
                hintStyle: const TextStyle(fontSize: 14),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/img/search-alt-w-svgrepo-com.svg', width: 16),
          ),
        ],
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 10, bottom: 60),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
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
                    Text('Nguyễn Ý Phương',
                        style: TextStyle(fontSize: 20, color: Color(0xFF333333))),
                    Text('Lớp: 47K14', style: TextStyle(color: Color(0xFF333333))),
                  ],
                ),
              ],
            ),
          ),
          buildFeatureBlock(context, "Thông tin cơ bản", [
            Feature(icon: "record-svgrepo-com.png", label: "Hồ sơ"),
            Feature(icon: "schedules-svgrepo-com.svg", label: "Lịch học"),
            Feature(icon: "score-svgrepo-com.svg", label: "Điểm số"),
            Feature(icon: "invoice-svgrepo-com.svg", label: "Học phí"),
          ]),
          buildFeatureBlock(context, "Gần đây", [
            Feature(icon: "score-svgrepo-com.svg", label: "Điểm số"),
            Feature(icon: "invoice-svgrepo-com.svg", label: "Học phí"),
          ]),
        ],
      ),
    );
  }

  Widget buildFeatureBlock(BuildContext context, String title, List<Feature> features) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            shrinkWrap: true,
            childAspectRatio: 1,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: features.map((f) => buildFeatureItem(context, f)).toList(),
          )
        ],
      ),
    );
  }

  Widget buildFeatureItem(BuildContext context, Feature feature) {
    final isSvg = feature.icon.toLowerCase().endsWith('.svg');

    return GestureDetector(
      onTap: () {
        if (feature.label == "Hồ sơ") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ThongTinSinhVienScreen()),
          );
        }
        // Có thể thêm các điều kiện khác tùy label
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isSvg
              ? SvgPicture.asset("assets/img/${feature.icon}", height: 50)
              : Image.asset("assets/img/${feature.icon}", height: 50),
          const SizedBox(height: 5),
          Text(feature.label, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class Feature {
  final String icon;
  final String label;

  Feature({required this.icon, required this.label});
}
