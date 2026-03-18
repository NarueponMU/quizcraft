import 'package:flutter/material.dart';

class CourseAnalysisPage extends StatefulWidget {
  const CourseAnalysisPage({super.key});

  @override
  State<CourseAnalysisPage> createState() => _CourseAnalysisPageState();
}

class _CourseAnalysisPageState extends State<CourseAnalysisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0053CC), // สีพื้นหลังหลัก
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF003E99),
              Color(0xFF0053CC),
              Color(0xFF227CFF),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // จัดให้อยู่กึ่งกลาง
              children: [
                const SizedBox(height: 20),
                // 1. Header (Back Button + Fire Icon + Title)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 24),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.local_fire_department, color: Color(0xFFFF9500), size: 36),
                        const SizedBox(width: 8),
                        const Text(
                          'Courses',
                          style: TextStyle(
                            color: Color(0xFFFF9500),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SF-Pro',
                          ),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
                const SizedBox(height: 24),

                // 2. Search Bar
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Course',
                      hintStyle: TextStyle(color: Colors.grey, fontFamily: 'SF-Pro'),
                      prefixIcon: Icon(Icons.search, color: Colors.black87),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // 3. Course Selector (Button)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F5F8), // ขาวอมเทา
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      'Course',
                      style: TextStyle(
                        color: Color(0xFFFF9500),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SF-Pro',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // 4. Main White Container (พื้นหลังหลักสีขาวอมเทาสำหรับเนื้อหาด้านล่างทั้งหมด)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F5F8),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 4.1 Grid 2x2 Stat Cards
                      Row(
                        children: [
                          Expanded(child: _buildStatCard('Total\nAttempts', '0', '')),
                          const SizedBox(width: 16),
                          Expanded(child: _buildStatCard('Average Score', '0', ' %')),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(child: _buildStatCard('Best Score', '0', ' %')),
                          const SizedBox(width: 16),
                          Expanded(child: _buildStatCard('Completion\nRate', '0', ' %')),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // 4.2 Course Process Section
                      const Text(
                        'Course Process',
                        style: TextStyle(
                          color: Color(0xFFFF9500),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SF-Pro',
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // กล่องพื้นหลังสีเทาอ่อนสำหรับ Progress Bars
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE2E6EC), // สีเทาอ่อนๆ ตามแบบ
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildProgressRow('Module Completed', 0.6, '6/10', const [Color(0xFFF96D52), Color(0xFFF4C873)]),
                            _buildProgressRow('Module Completed', 0.4, '4/10', const [Color(0xFF8F70FF), Color(0xFF56E0E0)]),
                            _buildProgressRow('Module Completed', 0.7, '7/10', const [Color(0xFF1ED6B4), Color(0xFF1CB5E0)]),
                            _buildProgressRow('Module Completed', 0.5, '5/10', const [Color(0xFF7F00FF), Color(0xFFE100FF)]),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),

                      // 4.3 Line Chart Area
                      SizedBox(
                        height: 180,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // แกน Y (เส้นขีดๆ)
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(12, (index) => Container(
                                width: 8, height: 1.5, color: Colors.grey[500],
                                margin: const EdgeInsets.symmetric(vertical: 6.5),
                              )),
                            ),
                            // ตัวกราฟเส้น
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(color: Colors.grey[500]!, width: 1.5),
                                    bottom: BorderSide(color: Colors.grey[500]!, width: 1.5),
                                  ),
                                ),
                                child: CustomPaint(
                                  painter: MockLineChartPainter(),
                                  child: Container(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // 4.4 Legend (คำอธิบายสีเส้นกราฟ)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 20),
                          _buildLegendDot(const Color(0xFFF96D52), 'Score'),
                          const SizedBox(width: 40),
                          _buildLegendDot(const Color(0xFF8F70FF), 'Average Score'),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget สำหรับสร้างกล่องสถิติย่อย 4 กล่อง
  Widget _buildStatCard(String title, String value, String unit) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFD9E2EC), // สีเทาอ่อน
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Color(0xFF4FA0FF), fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'SF-Pro'), // สีฟ้าสว่าง
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'SF-Pro', color: Colors.black87)),
                if (unit.isNotEmpty) Text(unit, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'SF-Pro', color: Colors.black87)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget สำหรับสร้างหลอด Progress Bar ในหน้า Courses
  Widget _buildProgressRow(String label, double progress, String ratioText, List<Color> gradientColors) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF4FA0FF), fontFamily: 'SF-Pro'),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      height: 8,
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                        color: Colors.grey[400], // สีหลอดพื้นหลัง (สีเทาเข้มขึ้นนิดนึง)
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: constraints.maxWidth * progress,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: gradientColors),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 35, // กำหนดความกว้างตายตัวให้ข้อความตรงกัน
                child: Text(
                  ratioText,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, fontFamily: 'SF-Pro'),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget สำหรับสร้างจุดสีอธิบายกราฟ
  Widget _buildLegendDot(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12, height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, fontFamily: 'SF-Pro')),
      ],
    );
  }
}

// คลาสพิเศษสำหรับวาดกราฟเส้นโค้งจำลอง (Mock Line Chart)
class MockLineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..color = const Color(0xFFF4C873) // สีเหลืองส้ม
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final paint2 = Paint()
      ..color = const Color(0xFF8F70FF).withOpacity(0.8) // สีม่วงอมฟ้า
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // เส้นที่ 1 (สีส้ม)
    final path1 = Path();
    path1.moveTo(0, size.height * 0.4);
    path1.quadraticBezierTo(size.width * 0.25, size.height * 0.8, size.width * 0.5, size.height * 0.4);
    path1.quadraticBezierTo(size.width * 0.75, size.height * 0.05, size.width, size.height * 0.8);
    canvas.drawPath(path1, paint1);

    // เส้นที่ 2 (สีม่วง)
    final path2 = Path();
    path2.moveTo(0, size.height * 0.7);
    path2.quadraticBezierTo(size.width * 0.15, size.height * 0.1, size.width * 0.4, size.height * 0.4);
    path2.quadraticBezierTo(size.width * 0.65, size.height * 0.8, size.width * 0.85, size.height * 0.6);
    path2.quadraticBezierTo(size.width * 0.95, size.height * 0.5, size.width, size.height * 0.3);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}