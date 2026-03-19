import 'dart:ui'; // 🔴 สำคัญมาก: ต้องมีสำหรับทำเอฟเฟกต์เบลอ (ImageFilter)
import 'package:flutter/material.dart';
import 'package:quizcraft/features/home/presentation/pages/home_page.dart';
import 'package:quizcraft/features/analysis/presentation/pages/analysis_page.dart';
import 'package:quizcraft/features/profile/presentation/pages/profile_page.dart';
import 'package:quizcraft/features/subject/presentation/pages/subject_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SubjectPage(),
    const AnalysisPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2A),
      extendBody: true, // ทำให้เนื้อหาพื้นหลังไหลทะลุลงไปใต้เมนู
      body: _pages[_selectedIndex],
      
      bottomNavigationBar: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          // 1. ใส่เงาจางๆ ด้านนอกสุดให้แคปซูลดูลอยขึ้นมา
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          // 2. ใช้ ClipRRect ตัดขอบให้โค้งมน เพื่อไม่ให้การเบลอล้นออกนอกกรอบ
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            // 3. BackdropFilter ทำหน้าที่เบลอสิ่งที่อยู่ข้างหลัง (พื้นหลังแอป)
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0), // ปรับความเบลอตรงนี้
              child: Container(
                height: 90,
                decoration: BoxDecoration(
                  // 4. ตั้งค่าสีพื้นหลังเมนูให้เป็นสีขาว/เทาแบบโปร่งแสง
                  color: Colors.white.withOpacity(0.12), 
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.white.withOpacity(0.2), width: 1), // เส้นขอบกระจก
                ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNavItem(icon: Icons.home_outlined, label: 'Home', index: 0),
                      _buildNavItem(icon: Icons.laptop_mac, label: 'Subject', index: 1), // เปลี่ยนไอคอนให้เหมือนในรูป
                      _buildNavItem(icon: Icons.bar_chart_outlined, label: 'Analysis', index: 2),
                      _buildNavItem(icon: Icons.account_circle_outlined, label: 'Profile', index: 3),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
  }

  Widget _buildNavItem({required IconData icon, required String label, required int index}) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // จำลองตามรูปเป๊ะๆ: ไม่ได้เลือกเป็นวงกลมขาวจางๆ / เลือกอยู่ให้โปร่งใสไม่มีวงกลม
                color: isSelected ? Colors.transparent : Colors.white.withOpacity(0.2),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 26,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontFamily: 'SF-Pro'
              ),
            ),
          ],
        ),
      ),
    );
  }
}