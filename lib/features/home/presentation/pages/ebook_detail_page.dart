import 'package:flutter/material.dart';

class EbookDetailPage extends StatelessWidget {
  // สร้างตัวแปรรับค่า เพื่อให้หน้านี้ใช้ซ้ำกับวิชาอื่นๆ ได้
  final String courseTitle;
  final String description;
  final List<String> pdfFiles;

  const EbookDetailPage({
    super.key,
    required this.courseTitle,
    required this.description,
    required this.pdfFiles,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B6DF9), // สีพื้นหลังหลัก
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // 1. Header (ปุ่ม Back แบบไม่มีพื้นหลัง + ชื่อวิชา)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ไอคอนลูกศรเปล่าๆ สำหรับกดย้อนกลับ
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 24),
                  ),
                  const SizedBox(width: 16),
                  
                  // ชื่อวิชา
                  Expanded(
                    child: Text(
                      courseTitle,
                      style: const TextStyle(
                        color: Color(0xFFFFB03A), // สีส้มตามแบบ
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SF-Pro', // ใส่ฟอนต์ให้สม่ำเสมอ
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 2. Course Description Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F5F8), // สีขาวอมเทา
                borderRadius: BorderRadius.circular(24),
                // ใส่เส้นขอบสีฟ้าอ่อนๆ ให้เหมือนในรูป
                border: Border.all(color: const Color(0xFF4FA0FF), width: 3), 
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Course Description',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: 'SF-Pro',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.5, // ระยะห่างบรรทัดให้อ่านง่าย
                      fontFamily: 'SF-Pro',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 3. PDF Files List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                itemCount: pdfFiles.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            pdfFiles[index],
                            style: const TextStyle(
                              color: Color(0xFF4FA0FF), // สีฟ้า
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'SF-Pro',
                            ),
                          ),
                        ),
                        const Icon(Icons.arrow_forward, color: Colors.black87),
                      ],
                    ),
                  );
                },
              ),
            ),
          ], // ปิด children ของ Column หลัก
        ),
      ),
    );
  }
}