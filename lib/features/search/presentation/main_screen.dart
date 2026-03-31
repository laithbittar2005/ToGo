import 'package:flutter/material.dart';
// تأكد من مسار الـ SearchScreen عندك ليكون صحيح
import 'package:togo/features/search/presentation/screens/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // هون بنحط الشاشات تبعك
  final List<Widget> _screens = [
    const SearchScreen(), // شاشتك الحقيقية اللي بعتلي كودها
    
    // شاشات وهمية مؤقتة لبين ما تبرمجهم
    const Center(
      child: Text('صفحة رحلاتي', style: TextStyle(color: Colors.white, fontSize: 24)),
    ),
    const Center(
      child: Text('صفحة القائمة', style: TextStyle(color: Colors.white, fontSize: 24)),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // نفس لون خلفية مشروعك
      // هون بنعرض الشاشة بناءً على الزر المضغوط
      body: _screens[_selectedIndex],
      
      // الشريط السفلي (Bottom Navigation Bar)
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF2C2C2E), // لون متناسق مع بوكسات البحث تبعك
        selectedItemColor: const Color(0xFFFFD700), // اللون الذهبي تبع الـ VIP
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed, // مهم عشان الألوان تضل ثابتة
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'البحث',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airport_shuttle), // أيقونة الباص للرحلات
            label: 'رحلاتي',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'القائمة',
          ),
        ],
      ),
    );
  }
}