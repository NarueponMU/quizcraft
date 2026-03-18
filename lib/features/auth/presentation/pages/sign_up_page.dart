import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color bgColor = const Color.fromRGBO(0, 0, 138, 80);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Create account',
                style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold,fontFamily: 'SF-Pro'),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? ", style: TextStyle(color: Colors.white70,fontFamily: 'SF-Pro')),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // กดย้อนกลับไปหน้า Login
                    },
                    child: const Text('Login', style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold,fontFamily: 'SF-Pro')),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // กล่องกรอกข้อมูลสีขาว
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(prefixIcon: Icon(Icons.person_outline), hintText: 'Tom Hillson', border: InputBorder.none),
                    ),
                    const Divider(),
                    const TextField(
                      decoration: InputDecoration(prefixIcon: Icon(Icons.email_outlined), hintText: 'tomhillson@gmail.com', border: InputBorder.none),
                    ),
                    const Divider(),
                    const TextField(
                      decoration: InputDecoration(prefixIcon: Icon(Icons.badge_outlined), hintText: 'Student ID', border: InputBorder.none),
                    ),
                    const Divider(),
                    const TextField(
                      decoration: InputDecoration(prefixIcon: Icon(Icons.phone), hintText: '081-XXX-XXXX', border: InputBorder.none),
                    ),
                    const Divider(),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(prefixIcon: Icon(Icons.lock_outline), hintText: 'Password', border: InputBorder.none),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: ใส่ Logic สมัครสมาชิก
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Register', style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'SF-Pro')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}