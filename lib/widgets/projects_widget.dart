import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../utils/app_colors.dart';

class ProjectsWidget extends StatelessWidget {
  const ProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'Epoh Agendamentos',
        'description': 'Sistema de agendamentos pessoais com notificações',
        'image': 'assets/epoh/icon.png',
        'tags': ['Flutter', 'Dart', 'Firebase', 'Provider', 'Arquitetura MVC '],
      },
      {
        'title': 'App Clinic Connect',
        'description':
            'Sistema de gerenciamento clinico, para organização de horarios, e agenda de pacientes',
        'image': 'assets/clinicapp/logo.jpeg',
        'tags': [
          'Flutter',
          'Supabase',
          'MobX',
          'Modular',
          'Clean Architecture',
        ],
      },
      {
        'title': 'Colab Social',
        'description': 'Sistema de gestão publica',
        'image': 'assets/colabSocial/icon.png',
        'tags': [
          'Flutter',
          'Dart',
          'API Rest',
          'MobX',
          'Modular',
          'Hive',
          'Arquitetura MVC ',
        ],
      },
    ];
    final isMobile = MediaQuery.of(context).size.width < 1024;

    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.only(
        top: 80,
        bottom: 20,
        left: isMobile ? 16 : 64,
        right: isMobile ? 16 : 64,
      ),
      child: SizedBox(
        child: Column(
          children: [
            FadeInDown(
              duration: const Duration(milliseconds: 600),
              child: const Text(
                'Projetos',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            const SizedBox(height: 48),
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 768;
                final isTablet = constraints.maxWidth < 1024;

                return Wrap(
                  spacing: 32,
                  runSpacing: 32,
                  alignment: WrapAlignment.center,
                  children: List.generate(projects.length, (index) {
                    double cardWidth;
                    if (isMobile) {
                      cardWidth = constraints.maxWidth;
                    } else if (isTablet) {
                      cardWidth = (constraints.maxWidth - 32) / 2;
                    } else {
                      cardWidth = (constraints.maxWidth - 64) / 3;
                    }

                    return FadeInUp(
                      duration: const Duration(milliseconds: 600),
                      delay: Duration(milliseconds: 200 + (index * 100)),
                      child: _ProjectCard(
                        title: projects[index]['title'] as String,
                        description: projects[index]['description'] as String,
                        image: projects[index]['image'] as String,
                        tags: projects[index]['tags'] as List<String>,
                        width: cardWidth,
                      ),
                    );
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  final List<String> tags;
  final double width;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.image,
    required this.tags,
    required this.width,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: widget.width,
        constraints: BoxConstraints(minHeight: 400),
        decoration: BoxDecoration(
          color: AppColors.background,
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
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
              child: Stack(
                children: [
                  AnimatedScale(
                    scale: _isHovered ? 1.05 : 1.0,
                    duration: const Duration(milliseconds: 300),
                    child: SizedBox(
                      height: 192,
                      width: double.infinity,
                      child: Image.network(
                        widget.image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: AppColors.surfaceLight,
                            child: const Icon(
                              Icons.image,
                              size: 64,
                              color: AppColors.textMuted,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            AppColors.background.withValues(alpha: 0.6),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textMuted,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.tags.map((tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceLight,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          tag,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        'Ver Projeto',
                        style: TextStyle(
                          fontSize: 14,
                          color: _isHovered
                              ? AppColors.primaryDark
                              : AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: _isHovered
                            ? AppColors.primaryDark
                            : AppColors.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
