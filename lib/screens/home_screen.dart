import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/about_widget.dart';
import '../widgets/footer_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/hero_widget.dart';
import '../widgets/projects_widget.dart';
import '../widgets/skills_widget.dart';
import '../widgets/experience_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey footerKey = GlobalKey();
  bool _isInitialized = false;
  bool _showLowerSections = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (mounted) {
        setState(() {
          _showLowerSections = true;
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      precacheImage(const AssetImage('assets/image.jpeg'), context);
      precacheImage(const AssetImage('assets/image.jpg'), context);
      _isInitialized = true;
    }
  }

  void scrollToSection(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned.fill(
            child:  RepaintBoundary(
              child: CustomPaint(painter: _DotGridPainter()),
            ),
          ),

          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Container(
                  key: homeKey,
                  child: HeroWidgetModern(
                    callback: () => scrollToSection(projectsKey),
                    onContactClick: () => scrollToSection(footerKey),
                  ),
                ),
                if (_showLowerSections) ...[
                  Container(key: aboutKey, child: const AboutWidget()),
                  Container(key: skillsKey, child: const SkillsWidget()),
                  Container(key: experienceKey, child: const ExperienceWidget()),
                  Container(key: projectsKey, child: const ProjectsWidget()),
                  Container(
                    key: footerKey,
                    child: FooterWidget(
                      onNavigate: (section) => _navigate(section),
                    ),
                  ),
                ],
              ],
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: HeaderWidget(
              onNavigate: (section) => _navigate(section),
            ),
          ),
        ],
      ),
    );
  }

  void _navigate(String section) {
    switch (section) {
      case 'home':
        scrollToSection(homeKey);
        break;
      case 'about':
        scrollToSection(aboutKey);
        break;
      case 'projects':
        scrollToSection(projectsKey);
        break;
      case 'experience':
        scrollToSection(experienceKey);
        break;
      case 'skills':
        scrollToSection(skillsKey);
        break;
      case 'footer':
        scrollToSection(footerKey);
        break;
    }
  }
}

class _DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.025)
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round;

    const double spacing = 28.0;
    final points = <Offset>[];

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height * 0.65; y += spacing) {
        points.add(Offset(x, y));
      }
    }

    canvas.drawPoints(PointMode.points, points, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
