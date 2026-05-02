import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../utils/app_colors.dart';

class SkillsWidget extends StatefulWidget {
  const SkillsWidget({super.key});

  @override
  State<SkillsWidget> createState() => _SkillsWidgetState();
}

class _SkillsWidgetState extends State<SkillsWidget> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1024;
    final paddingHorizontal = isMobile ? 24.0 : 120.0;

    return VisibilityDetector(
      key: const Key('skills-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: Container(
        width: double.infinity,
        color: AppColors.background,
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? 32 : 50,
          horizontal: paddingHorizontal,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'HABILIDADES',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
              color: Color(0xFF6366F1),
            ),
          ).animate().fadeIn(duration: 600.ms).slideY(begin: -0.05, end: 0, duration: 600.ms),
          const SizedBox(height: 8),
          const Text(
            'Tecnologias que uso',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ).animate().fadeIn(duration: 600.ms, delay: 100.ms).slideY(begin: -0.05, end: 0, duration: 600.ms, delay: 100.ms),
          const SizedBox(height: 48),

          if (isMobile)
            Column(children: [
              _buildSkillGroup('Frontend', _frontendSkills),
              const SizedBox(height: 48),
              _buildSkillGroup('Backend', _backendSkills),
              const SizedBox(height: 48),
              _buildSkillGroup('Ferramentas', _toolSkills),
            ])
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildSkillGroup('Frontend', _frontendSkills)),
                const SizedBox(width: 40),
                Expanded(child: _buildSkillGroup('Backend', _backendSkills)),
                const SizedBox(width: 40),
                Expanded(child: _buildSkillGroup('Ferramentas', _toolSkills)),
              ],
            ),

          const SizedBox(height: 64),

          // All techs box
          _buildAllTechsBox(isMobile)
              .animate()
              .fadeIn(duration: 600.ms, delay: 300.ms)
              .slideY(begin: 0.05, end: 0, duration: 600.ms, delay: 300.ms),
        ],
      ),
    ));
  }

  static final _frontendSkills = [
    _SkillItem('Dart / Flutter', 90, const Color(0xFF8B5CF6), const Color(0xFF6366F1)),
    _SkillItem('MobX / BloC / GetX', 75, const Color(0xFF6366F1), const Color(0xFF3B82F6)),
    _SkillItem('React / TypeScript', 50, const Color(0xFF3B82F6), const Color(0xFF06B6D4)),
    _SkillItem('Modular', 90, const Color(0xFFF59E0B), const Color(0xFFEF4444)),
  ];

  static final _backendSkills = [
    _SkillItem('Firebase', 70, const Color(0xFF06B6D4), const Color(0xFF10B981)),
    _SkillItem('Supabase', 60, const Color(0xFF10B981), const Color(0xFF34D399)),
    _SkillItem('Next.js', 50, const Color(0xFF34D399), const Color(0xFFFBBF24)),
    _SkillItem('Hive / SQLite', 70, const Color(0xFF10B981), const Color(0xFF06B6D4)),

  ];

  static final _toolSkills = [
    _SkillItem('Figma / UI Design', 80, const Color(0xFF8B5CF6), const Color(0xFFEC4899)),
    _SkillItem('Git & GitHub', 70, const Color(0xFF3B82F6), const Color(0xFF6366F1)),
  ];

  Widget _buildSkillGroup(String title, List<_SkillItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 3,
              height: 18,
              decoration: BoxDecoration(
                color: const Color(0xFF6366F1),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),
        ...items.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(color: Color(0xFFCBD5E1), fontSize: 14),
                      ),
                      Text(
                        '${item.percentage}%',
                        style: const TextStyle(color: Color(0xFF64748B), fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Stack(
                    children: [
                      Container(
                        height: 5,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1A24),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      LayoutBuilder(builder: (context, constraints) {
                        final targetWidth = constraints.maxWidth * (item.percentage / 100);
                        return TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin: 0.0, end: _isVisible ? targetWidth : 0.0),
                          duration: const Duration(milliseconds: 1500),
                          curve: Curves.easeOutQuart,
                          builder: (context, value, child) {
                            return Container(
                              height: 5,
                              width: value,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [item.colorStart, item.colorEnd],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            );
                          },
                        );
                      }),
                    ],
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget _buildAllTechsBox(bool isMobile) {
    final tags = [
      'Dart', 'Flutter', 'MobX', 'BloC', 'Provider', 'GetX', 'Modular',
      'Atomic Design', 'Clean Architecture', 'React', 'TypeScript',
      'Firebase', 'Supabase', 'REST APIs', 'Hive', 'SQLite',
      'Git', 'GitHub', 'Figma', 'Nest.js',
      'Publicação App Store', 'Publicação Google Play',
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 20 : 32),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'TODAS AS TECNOLOGIAS',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
              color: Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: tags
                .map((tag) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          color: Color(0xFFCBD5E1),
                          fontSize: 13,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _SkillItem {
  final String name;
  final int percentage;
  final Color colorStart;
  final Color colorEnd;
  _SkillItem(this.name, this.percentage, this.colorStart, this.colorEnd);
}
