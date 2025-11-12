import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portifolio_linykeer_almeida/utils/app_colors.dart';

class CarrouselSkils extends StatefulWidget {
  const CarrouselSkils({super.key});

  @override
  State<CarrouselSkils> createState() => _CarrouselSkilsState();
}

class _CarrouselSkilsState extends State<CarrouselSkils> {
  final ScrollController _scrollController = ScrollController();
  late final List<String> _skills;
  bool _isHovered = false;
  double scrollSpeed = 20;

  @override
  void initState() {
    super.initState();

    _skills = [
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
    ];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() async {
    while (mounted) {
      if (_isHovered) {
        await Future.delayed(const Duration(milliseconds: 100));
        continue;
      }

      await Future.delayed(const Duration(milliseconds: 16));
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.offset - (scrollSpeed / 60));

        if (_scrollController.offset <= 0) {
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        }
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1024;

    final items = [..._skills, ..._skills];

    return Container(
      height: 80,
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      color: AppColors.surface,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 60),
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
            ),
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              child: Row(
                children: items.map((e) {
                  return Padding(
                    padding: EdgeInsets.only(right: isMobile ? 32 : 50),
                    child: Text(
                      e,
                      style: TextStyle(
                        fontSize: isMobile ? 18 : 26,
                        color: Colors.white.withValues(alpha: 0.2),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
