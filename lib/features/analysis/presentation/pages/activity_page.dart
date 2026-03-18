import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  String _selectedTime = 'This Week';
  final List<String> _timeOptions = ['This Week', 'This Month', 'This Year'];

  // ฟังก์ชันเปลี่ยนชื่อหัวข้อกราฟตาม Dropdown
  String _getChartTitle() {
    switch (_selectedTime) {
      case 'This Month':
        return 'Monthly Activity';
      case 'This Year':
        return 'Yearly Activity';
      case 'This Week':
      default:
        return 'Weekly Activity';
    }
  }

  // ฟังก์ชันเปลี่ยนแท่งกราฟ (แกน X และข้อมูล) ตาม Dropdown
  Widget _buildDynamicChart() {
    List<Widget> bars = [];

    if (_selectedTime == 'This Month') {
      // ดึงข้อมูลเป็นสัปดาห์ (Week 1 - Week 4)
      bars = [
        _buildBarGroup('W1', 0.5, 0.8),
        _buildBarGroup('W2', 0.7, 0.4),
        _buildBarGroup('W3', 0.9, 0.6),
        _buildBarGroup('W4', 0.3, 0.5),
      ];
    } else if (_selectedTime == 'This Year') {
      // ดึงข้อมูลเป็นไตรมาส (Q1 - Q4)
      bars = [
        _buildBarGroup('Q1', 0.8, 0.9),
        _buildBarGroup('Q2', 0.6, 0.5),
        _buildBarGroup('Q3', 0.7, 0.8),
        _buildBarGroup('Q4', 0.9, 0.7),
      ];
    } else {
      // ค่าเริ่มต้น (This Week หรือ Today) ดึงข้อมูลเป็นวัน (Sun - Sat)
      bars = [
        _buildBarGroup('Sun', 0.6, 0.5),
        _buildBarGroup('Mon', 0.7, 0.2),
        _buildBarGroup('Tue', 0.4, 0.7),
        _buildBarGroup('Wed', 0.3, 0.4),
        _buildBarGroup('Thur', 0.5, 0.6),
        _buildBarGroup('Fri', 0.1, 0.4),
        _buildBarGroup('Sat', 0.2, 0.1), 
      ];
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: bars,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0053CC),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // 1. Header
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
                          'Activity',
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

                // 2. Dropdown
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedTime,
                        icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                        style: const TextStyle(
                          color: Colors.black, 
                          fontSize: 18, 
                          fontWeight: FontWeight.bold, 
                          fontFamily: 'SF-Pro',
                        ),
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        elevation: 2,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              _selectedTime = newValue; // พอค่าเปลี่ยน กราฟข้างล่างก็จะเปลี่ยนตาม
                            });
                          }
                        },
                        items: _timeOptions.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // 3. Stat Cards
                Row(
                  children: [
                    Expanded(child: _buildStatCard(title: 'Total Quizzes\nTaken', value: '0', unit: '', titleColor: Colors.redAccent)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildStatCard(title: 'Total Time\nSpent', value: '0', unit: ' Hr', titleColor: Colors.lightBlue)),
                  ],
                ),
                const SizedBox(height: 16),

                // 4. Streak Card
                Row(
                  children: [
                    Expanded(child: _buildStatCard(title: 'Streak', value: '0', unit: ' Day', titleColor: const Color(0xFFFF9500))),
                    const SizedBox(width: 16),
                    const Expanded(child: SizedBox()),
                  ],
                ),
                const SizedBox(height: 24),

                // 5. Dynamic Chart Area
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F5F8),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      // เรียกใช้ฟังก์ชันดึงชื่อหัวข้อกราฟ (เช่น Weekly Activity -> Monthly Activity)
                      Text(
                        _getChartTitle(), 
                        style: const TextStyle(
                          color: Color(0xFFFF9500),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SF-Pro',
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 200,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('10', style: TextStyle(fontSize: 10, color: Colors.black54)),
                                Text('9', style: TextStyle(fontSize: 10, color: Colors.black54)),
                                Text('6', style: TextStyle(fontSize: 10, color: Colors.black54)),
                                Text('3', style: TextStyle(fontSize: 10, color: Colors.black54)),
                                Text('0', style: TextStyle(fontSize: 10, color: Colors.black54)),
                                SizedBox(height: 20),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              // เรียกใช้ฟังก์ชันสร้างแท่งกราฟใหม่ตามตัวเลือก
                              child: _buildDynamicChart(), 
                            ),
                          ],
                        ),
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

  // (ส่วน _buildStatCard และ _buildBarGroup เหมือนเดิมทุกประการครับ)
  Widget _buildStatCard({required String title, required String value, required String unit, required Color titleColor}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: titleColor, fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'SF-Pro')),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(value, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'SF-Pro')),
                if (unit.isNotEmpty) Text(unit, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'SF-Pro')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarGroup(String day, double height1, double height2) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 8, height: 150 * height1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF56E0E0), Color(0xFF8F70FF)]),
              ),
            ),
            const SizedBox(width: 4),
            Container(
              width: 8, height: 150 * height2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF55E37D), Color(0xFF1E8F43)]),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(day, style: const TextStyle(fontSize: 10, color: Colors.black87, fontFamily: 'SF-Pro')),
      ],
    );
  }
}