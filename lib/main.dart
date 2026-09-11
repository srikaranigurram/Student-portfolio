import 'package:flutter/material.dart';
import 'package:student_portfolio/screens/home_page.dart';
import 'package:student_portfolio/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const StudentPortfolioApp());
}

class StudentPortfolioApp extends StatelessWidget {
  const StudentPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}