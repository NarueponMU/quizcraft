import 'package:flutter/material.dart';
import 'edit_profile_page.dart';
import 'logout_page.dart';
// import 'sign_in_page.dart'; // อย่าลืม import หน้า Login ไว้สำหรับกด Logout นะครับ

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
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
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                // 1. หัวข้อ Profile
                const Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF-Pro',
                  ),
                ),
                const SizedBox(height: 30),

                // 2. รูปโปรไฟล์พร้อมวงกลมเล็กๆ ด้านล่าง
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4), // เส้นขอบสีขาวบางๆ
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage('assets/images/Toy.jpg'),
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
                        child: const SizedBox(width: 5, height: 5), // จุดวงกลมเล็กๆ
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // 3. ชื่อและอีเมล
                const Text(
                  'Tom Hillson',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF-Pro',
                  ),
                ),
                const Text(
                  'Tomhill@gmail.com',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontFamily: 'SF-Pro',
                  ),
                ),
                const SizedBox(height: 50),

                // 4. รายการเมนู
                _buildProfileMenu(
                  icon: Icons.settings_outlined,
               title: 'Edit Profile',
               showArrow: true,
               onTap: () {
                 //ใส่คำสั่งเปลี่ยนหน้าตรงนี้ครับ
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => const EditProfilePage()),
                 );
               },
                ),
                const SizedBox(height: 30),

                _buildAccountSecurity(), // เมนูพิเศษที่มี Progress Bar
                
                const SizedBox(height: 30),

                _buildProfileMenu(
                  icon: Icons.logout,
               title: 'Logout',
               showArrow: false,
               onTap: () {
                 // ใส่คำสั่งเด้งไปหน้ายืนยัน Logout
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => const LogoutPage()),
                 );
               },
                ),
                
                const SizedBox(height: 100), // เผื่อที่ให้ Bottom Nav
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget สำหรับเมนูทั่วไป
  Widget _buildProfileMenu({
    required IconData icon,
    required String title,
    required bool showArrow,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 32),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'SF-Pro',
              ),
            ),
          ),
          if (showArrow)
            const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 18),
        ],
      ),
    );
  }

  // Widget สำหรับเมนู Account Security ที่มี Progress Bar
  Widget _buildAccountSecurity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.lock_outline, color: Colors.white, size: 32),
            const SizedBox(width: 20),
            const Text(
              'Account Security',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'SF-Pro',
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 52), // ให้ตรงกับตัวอักษรด้านบน
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const LinearProgressIndicator(
                  value: 0.8, // 80%
                  minHeight: 8,
                  backgroundColor: Colors.white24,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Excellent',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontFamily: 'SF-Pro',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}