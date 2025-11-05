import 'package:flutter/material.dart';
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
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Container(key: homeKey, child: const HeroWidget()),
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
    );
  }
}
