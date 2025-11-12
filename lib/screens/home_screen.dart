import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portifolio_linykeer_almeida/utils/app_colors.dart';
import 'package:portifolio_linykeer_almeida/widgets/carrousel_skils.dart';
import 'package:portifolio_linykeer_almeida/widgets/skils_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/hero_widget.dart';
import '../widgets/about_widget.dart';
import '../widgets/services_widget.dart';
import '../widgets/projects_widget.dart';
import '../widgets/footer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey skilsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
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
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1A1A1D), Color(0xFF121214)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Container(key: homeKey, child: const HeroWidget()),
                  CarrouselSkils(),
                  Container(key: aboutKey, child: const AboutWidget()),
                  Container(key: skilsKey, child: const SkilsWidget()),
                  Container(key: servicesKey, child: const ServicesWidget()),
                  Container(key: projectsKey, child: const ProjectsWidget()),
                  FooterWidget(
                    onNavigate: (section) {
                      switch (section) {
                        case 'home':
                          scrollToSection(homeKey);
                          break;
                        case 'about':
                          scrollToSection(aboutKey);
                          break;
                        case 'services':
                          scrollToSection(servicesKey);
                          break;
                        case 'projects':
                          scrollToSection(projectsKey);
                          break;
                        case 'skils':
                          scrollToSection(skilsKey);
                          break;
                      }
                    },
                  ),
                ],
              ),
            ),
            HeaderWidget(
              onNavigate: (section) {
                switch (section) {
                  case 'home':
                    scrollToSection(homeKey);
                    break;
                  case 'about':
                    scrollToSection(aboutKey);
                    break;
                  case 'services':
                    scrollToSection(servicesKey);
                    break;
                  case 'projects':
                    scrollToSection(projectsKey);
                    break;
                  case 'skils':
                    scrollToSection(skilsKey);
                    break;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
