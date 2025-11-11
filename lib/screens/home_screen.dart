import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portifolio_linykeer_almeida/utils/app_colors.dart';
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
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey skils = GlobalKey();
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
    final isMobile = MediaQuery.of(context).size.width < 768;
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
                  Container(
                    height: 80,
                    margin: const EdgeInsets.only(bottom: 20),
                    width: double.infinity,
                    color: AppColors.surface,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 16 : 60,
                      ),
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(
                          dragDevices: {
                            PointerDeviceKind.mouse,
                            PointerDeviceKind.touch,
                          },
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...[
                                'Dart',
                                'Flutter',
                                'React',
                                'Typescript',
                                'Firebase',
                                'Git',
                                'Arquitetura MVC',
                                'Modular',
                                'MobX',
                                'GetX',
                                'Provider',
                                'Figma',
                                'Hive/SQLite',
                                'Publicação Google Play',
                                'Publicação App Store',
                              ].map((e) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    right: isMobile ? 32 : 50,
                                  ),
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                      fontSize: isMobile ? 18 : 26,
                                      color: Colors.white.withValues(
                                        alpha: 0.2,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(key: aboutKey, child: const AboutWidget()),
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
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
