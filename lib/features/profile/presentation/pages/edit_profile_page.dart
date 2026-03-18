import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // สีใสเพื่อให้เห็นไล่สีด้านล่าง
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF003E99), // สีเข้มสุดด้านบน
              Color(0xFF0053CC),
              Color(0xFF227CFF), // สีสว่างสุดด้านล่าง
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                
                // 1. Header (ปุ่ม Back + หัวข้อ Edit Profile)
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
                    const Text(
                      'Edit Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SF-Pro',
                      ),
                    ),
                    const Expanded(child: SizedBox()), // ปล่อยว่างไว้ให้สมดุลกับปุ่ม Back
                  ],
                ),
                const SizedBox(height: 40),

                // 2. รูปโปรไฟล์
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        radius: 50, // ปรับให้เล็กลงจากหน้า Profile หลักนิดหน่อยตามรูป
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage('assets/images/Toy.jpg'), // ใส่ Path รูปของคุณ
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const SizedBox(width: 4, height: 4),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // 3. ชื่อและอีเมล
                const Text(
                  'Tom Hillson',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'SF-Pro'),
                ),
                const Text(
                  'Tomhill@gmail.com',
                  style: TextStyle(color: Colors.white70, fontSize: 14, fontFamily: 'SF-Pro'),
                ),
                const SizedBox(height: 40),

                // 4. ช่องกรอกข้อมูล (Text Fields)
                _buildTextField(
                  prefixIcon: Icons.person_outline,
                  hintText: 'FULL NAME',
                ),
                const SizedBox(height: 20),
                
                _buildTextField(
                  prefixIcon: Icons.mail_outline,
                  hintText: 'EMAIL',
                ),
                const SizedBox(height: 20),
                
                _buildTextField(
                  prefixIcon: Icons.lock_outline,
                  hintText: 'PASSWORD',
                  isPassword: true, // ทำให้พิมพ์แล้วเป็นจุดๆ
                ),
                const SizedBox(height: 40),

                // 5. ปุ่ม Save Changes
                GestureDetector(
                  onTap: () {
                    // TODO: บันทึกข้อมูลและย้อนกลับ
                    // Navigator.pop(context); 
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF003380), // สีน้ำเงินเข้ม
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'SAVE CHANGES',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SF-Pro',
                        ),
                      ),
                    ),
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

  // Widget ช่วยสำหรับสร้างช่องกรอกข้อมูลสีขาว
  Widget _buildTextField({required IconData prefixIcon, required String hintText, bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF2F5F8), // ขาวอมเทานิดๆ
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        obscureText: isPassword, // ถ้าเป็นรหัสผ่านจะซ่อนข้อความ
        style: const TextStyle(fontWeight: FontWeight.w600, fontFamily: 'SF-Pro'),
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon, color: Colors.grey[400], size: 24),
          suffixIcon: Icon(Icons.edit_outlined, color: Colors.grey[400], size: 20),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2, // เพิ่มระยะห่างตัวอักษรให้เหมือนดีไซน์
            fontFamily: 'SF-Pro',
            fontSize: 14,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 20), // เพิ่มความอ้วนให้กล่อง
        ),
      ),
    );
  }
}