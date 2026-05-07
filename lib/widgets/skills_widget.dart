import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    final paddingHorizontal = isMobile ? 16.0 : 120.0;

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
    final List<Map<String, dynamic>> tags = [
      {'name': 'Dart', 'icon': FontAwesomeIcons.code},
      {'name': 'Flutter', 'icon': FontAwesomeIcons.mobileScreen},
      {'name': 'SOLID', 'icon': Icons.architecture},
      {'name': 'Clean Architecture', 'icon': Icons.architecture},
      {'name': 'MobX', 'icon': Icons.sync},
      {'name': 'BloC', 'icon': Icons.layers},
      {'name': 'Provider', 'icon': Icons.account_tree},
      {'name': 'GetX', 'icon': Icons.rocket_launch},
      {'name': 'Modular', 'icon': Icons.view_module},
      {'name': 'Atomic Design', 'icon': Icons.science},
      {'name': 'React', 'icon': FontAwesomeIcons.react},
      {'name': 'TypeScript', 'icon': FontAwesomeIcons.terminal},
      {'name': 'Firebase', 'icon': FontAwesomeIcons.fire},
      {'name': 'Supabase', 'icon': Icons.bolt},
      {'name': 'Nest.js', 'icon': Icons.api_outlined},
      {'name': 'REST APIs', 'icon': Icons.api},
      {'name': 'Hive', 'icon': Icons.storage},
      {'name': 'SQLite', 'icon': Icons.storage},
      {'name': 'Git', 'icon': FontAwesomeIcons.gitAlt},
      {'name': 'GitHub', 'icon': FontAwesomeIcons.github},
      {'name': 'Figma', 'icon': FontAwesomeIcons.figma},
      {'name': 'Publicação App Store', 'icon': FontAwesomeIcons.apple},
      {'name': 'Publicação Google Play', 'icon': FontAwesomeIcons.googlePlay},
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 24 : 40),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF6366F1).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.grid_view_rounded, color: Color(0xFF6366F1), size: 18),
              ),
              const SizedBox(width: 14),
              const Text(
                'TODAS AS TECNOLOGIAS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                  color: Color(0xFF94A3B8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: tags
                .map((tag) => _TechTag(tag: tag))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _TechTag extends StatefulWidget {
  final Map<String, dynamic> tag;
  const _TechTag({required this.tag});

  @override
  State<_TechTag> createState() => _TechTagState();
}

class _TechTagState extends State<_TechTag> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: _isHovered ? const Color(0xFF1E1E2E) : AppColors.background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isHovered 
                ? const Color(0xFF6366F1).withValues(alpha: 0.5) 
                : Colors.white.withValues(alpha: 0.08),
            width: 1.2,
          ),
          boxShadow: _isHovered ? [
            BoxShadow(
              color: const Color(0xFF6366F1).withValues(alpha: 0.15),
              blurRadius: 15,
              spreadRadius: 2,
            )
          ] : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.tag['icon'],
              size: 15,
              color: _isHovered ? const Color(0xFF818CF8) : const Color(0xFF64748B),
            ),
            const SizedBox(width: 10),
            Text(
              widget.tag['name'],
              style: TextStyle(
                color: _isHovered ? Colors.white : const Color(0xFFCBD5E1),
                fontSize: 13,
                fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
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
