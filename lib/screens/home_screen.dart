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
  int _renderStep = 0;

  @override
  void initState() {
    super.initState();
    _startProgressiveRender();
  }

  void _startProgressiveRender() async {
    // Dá 800ms de prioridade total para as animações do Hero finalizarem suavemente
    // antes de começar a construir o restante do site.
    await Future.delayed(const Duration(milliseconds: 800));
    
    for (int i = 1; i <= 5; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (mounted) {
        setState(() {
          _renderStep = i;
        });
      }
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
                RepaintBoundary(
                  key: homeKey,
                  child: HeroWidgetModern(
                    callback: () => scrollToSection(projectsKey),
                    onContactClick: () => scrollToSection(footerKey),
                  ),
                ),
                if (_renderStep >= 1) RepaintBoundary(key: aboutKey, child: const AboutWidget()),
                if (_renderStep >= 2) RepaintBoundary(key: skillsKey, child: const SkillsWidget()),
                if (_renderStep >= 3) RepaintBoundary(key: experienceKey, child: const ExperienceWidget()),
                if (_renderStep >= 4) RepaintBoundary(key: projectsKey, child: const ProjectsWidget()),
                if (_renderStep >= 5) RepaintBoundary(
                  key: footerKey,
                  child: FooterWidget(
                    onNavigate: (section) => _navigate(section),
                  ),
                ),
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
  static List<Offset>? _cachedPoints;
  static Size? _cachedSize;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.025)
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round;

    if (_cachedPoints == null || _cachedSize != size) {
      const double spacing = 28.0;
      final points = <Offset>[];

      for (double x = 0; x < size.width; x += spacing) {
        for (double y = 0; y < size.height * 0.65; y += spacing) {
          points.add(Offset(x, y));
        }
      }
      _cachedPoints = points;
      _cachedSize = size;
    }

    canvas.drawPoints(PointMode.points, _cachedPoints!, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
