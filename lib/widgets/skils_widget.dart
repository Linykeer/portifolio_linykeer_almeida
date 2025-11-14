import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../utils/app_colors.dart';

class SkilsWidget extends StatelessWidget {
  const SkilsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1024;

    final skils = [
      {
        'icon': LucideIcons.code2,
        'title': 'Linguagens',
        'list': ['Dart', 'TypeScript', 'JavaScript'],
      },
      {
        'icon': LucideIcons.layers,
        'title': 'Frameworks & Libraries',
        'list': ['Flutter', 'React', 'Flutter Web'],
      },
      {
        'icon': LucideIcons.wrench,
        'title': 'Gerenciamento de Estado',
        'list': ['MobX', 'Provider', 'GetX', 'Modular'],
      },
      {
        'icon': LucideIcons.database,
        'title': 'Database & Backend',
        'list': ['Firebase', 'Hive', 'SQLite', 'REST APIs'],
      },
      {
        'icon': LucideIcons.layers,
        'title': 'Arquitetura & Padrões',
        'list': ['MVC', 'Clean Architecture', 'SOLID'],
      },
      {
        'icon': LucideIcons.wrench,
        'title': 'Ferramentas',
        'list': [
          'Git',
          'GitHub',
          'Figma',
          'Google Play Console',
          'App Store Connect',
        ],
      },
    ];

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: isMobile ? Alignment.bottomRight : Alignment.centerLeft,
          end: isMobile ? Alignment.topCenter : Alignment.centerRight,
          colors: [Color(0xFF0F172A), AppColors.background],
        ),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: isMobile ? -70 : 30,
            right: isMobile ? 120 : -80,
            child: Container(
              width: 480,
              height: 480,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF3B82F6).withValues(alpha: 0.30),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 1.0],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 32,
              left: isMobile ? 16 : 64,
              right: isMobile ? 16 : 64,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 32),
                FadeInDown(
                  duration: const Duration(milliseconds: 600),
                  child: const Text(
                    'Habilidades & Conhecimentos',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 48),

                LayoutBuilder(
                  builder: (context, constraints) {
                    return Wrap(
                      spacing: 32,
                      runSpacing: 32,
                      alignment: WrapAlignment.center,
                      children: List.generate(skils.length, (index) {
                        return FadeInUp(
                          duration: const Duration(milliseconds: 600),
                          delay: Duration(milliseconds: 200 + (index * 100)),
                          child: _SkilsCard(
                            icon: skils[index]['icon'] as IconData,
                            title: skils[index]['title'] as String,
                            list: skils[index]['list'] as List<String>,
                            width: isMobile ? constraints.maxWidth : 350,
                          ),
                        );
                      }),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SkilsCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final List<String> list;
  final double width;

  const _SkilsCard({
    required this.icon,
    required this.title,
    required this.list,
    required this.width,
  });

  @override
  State<_SkilsCard> createState() => _SkilsCardState();
}

class _SkilsCardState extends State<_SkilsCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: widget.width,
        constraints: const BoxConstraints(minHeight: 150),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(2, 4),
              color: Colors.black.withValues(alpha: 0.25),
            ),
          ],
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _isHovered
                ? AppColors.primary.withValues(alpha: 0.5)
                : AppColors.surfaceLight,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(widget.icon, color: const Color(0xFF3B82F6), size: 18),
                const SizedBox(width: 8),
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Wrap(
              alignment: WrapAlignment.start,
              spacing: 6,
              runSpacing: 6,
              children: widget.list
                  .map(
                    (e) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.06),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.1),
                        ),
                      ),
                      child: Text(
                        e,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
