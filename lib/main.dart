import 'package:flutter/material.dart';
import 'package:togo/features/search/presentation/main_screen.dart';

void main() {
  runApp(const ToGoApp());
}

class ToGoApp extends StatelessWidget {
  const ToGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToGo',
      theme: ThemeData(
        // عشان يطابق ألوانك الداكنة
        scaffoldBackgroundColor: const Color(0xFF121212), 
      ),
      home: const MainScreen(), // هون السر! بنستدعي الشاشة اللي فيها الشريط السفلي
    );
  }
}