import 'package:flutter/material.dart';
import 'ebook_detail_page.dart';

class EbookPage extends StatefulWidget {
  const EbookPage({super.key});

  @override
  State<EbookPage> createState() => _EbookPageState();
}

class _EbookPageState extends State<EbookPage> {
  // ตัวแปรสำหรับเช็คว่าตอนนี้เลือก Year 1 หรือ Year 2 อยู่
  bool isYear1Selected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B6DF9), // สีพื้นหลังสีน้ำเงินตามแบบ
      body: SafeArea(
        child: Column(
          children: [
            // 1. Header (ปุ่ม Back + หัวข้อ E-Book)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.pop(context), // กดย้อนกลับไปหน้า Home
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'E-Book',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SF-Pro'
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // ใส่พื้นที่ว่างให้สมดุลกับปุ่ม Back
                ],
              ),
            ),

            // 2. Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Course',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search, color: Colors.black87),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 3. Tabs (Year 1 / Year 2)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(child: _buildTab('Year 1', isYear1Selected, () {
                    setState(() => isYear1Selected = true);
                  })),
                  const SizedBox(width: 16),
                  Expanded(child: _buildTab('Year 2', !isYear1Selected, () {
                    setState(() => isYear1Selected = false);
                  },
                  selectedColor: const Color(0xFFE46CF4)
                  )),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 4. List of Courses (รายการรายวิชา)
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                children: [
                  _buildCourseCard(
                    context: context,
                    code: 'ITDS120',
                    title: 'Fundamentals of Programming',
                    description: 'This course includes basic programming concepts such as variables, loops, conditions, and functions.',
                    pdfs: [
                      'L01-IntroToProgramming.pdf',
                      'L02-Python Basics.pdf',
                      'L03-Selections.pdf',
                    ],
                  ),
                  _buildCourseCard(
                    context: context,
                    code: 'ITDS121',
                    title: 'Advanced Programming',
                    description: 'Advanced concepts including Object-Oriented Programming (OOP), Data Structures, and Algorithms.',
                    pdfs: [
                      'L01-OOP Concepts.pdf',
                      'L02-Classes and Objects.pdf',
                    ],
                  ),
                  // สามารถก๊อปปี้ _buildCourseCard เพิ่มได้เลยครับ
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget สำหรับสร้างปุ่ม Tab
  Widget _buildTab(String title, bool isSelected, VoidCallback onTap, {Color selectedColor = const Color(0xFFFFD15C)}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : Colors.white, // สีเหลืองเมื่อเลือก / สีขาวเมื่อไม่เลือก
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black87 : Colors.black54,
              fontFamily: 'SF-Pro'
            ),
          ),
        ),
      ),
    );
  }

  // Widget สำหรับสร้างการ์ดรายวิชา
  // แก้ไข Widget _buildCourseCard ให้รับค่าและกดได้
  Widget _buildCourseCard({
    required BuildContext context, // รับ context มาใช้เปลี่ยนหน้า
    required String code, 
    required String title,
    required String description,   // รับคำอธิบายเพิ่มเติม
    required List<String> pdfs,    // รับรายชื่อไฟล์เพิ่มเติม
  }) {
    // 1. ครอบด้วย GestureDetector เพื่อให้กดได้
    return GestureDetector(
      onTap: () {
        // 2. เมื่อกดการ์ด ให้ส่งข้อมูลข้ามไปที่หน้า EbookDetailPage
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EbookDetailPage(
              courseTitle: title,
              description: description,
              pdfFiles: pdfs,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        clipBehavior: Clip.antiAlias, // ตัดขอบให้โค้งมนตาม borderRadius
        child: Column(
          children: [
            // ส่วนบน: รูปภาพ (จำลองเป็นสีเทาและมีไอคอน)
            Container(
              height: 160,
              color: const Color(0xFFF2F5F8),
              child: Stack(
                children: [
                  const Center(
                    child: Icon(Icons.image, size: 60, color: Colors.black26),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.more_horiz, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
            ),
            // ส่วนล่าง: พื้นหลังสีเข้มและชื่อวิชา
            Container(
              padding: const EdgeInsets.all(20),
              color: const Color(0xFF333333), // สีเทาเข้ม
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          code,
                          style: const TextStyle(
                            color: Color(0xFFFFB03A), // สีส้ม
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SF-Pro' // ใช้ฟอนต์ที่คุณกำหนดไว้
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          title,
                          style: const TextStyle(
                            color: Color(0xFF4FA0FF), // สีฟ้า
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'SF-Pro' // ใช้ฟอนต์ที่คุณกำหนดไว้
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis, // ถ้าชื่อยาวไปให้ขึ้น ...
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}