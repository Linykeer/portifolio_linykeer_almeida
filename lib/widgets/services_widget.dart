import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../utils/app_colors.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        'icon': Icons.code,
        'title': 'Desenvolvimento Mobile',
        'description':
            'Criação de aplicativos híbridos com foco em performance, escalabilidade e boa experiência',
      },
      {
        'icon': Icons.code,
        'title': 'Desenvolvimento Web',
        'description':
            'Criação de websites modernos e responsivos com as melhores tecnologias do mercado.',
      },
      {
        'icon': Icons.palette,
        'title': 'Prototipações',
        'description':
            'Design de interfaces intuitivas e experiências de usuário memoráveis.',
      },
      {
        'icon': Icons.dns,
        'title': 'Publicações',
        'description':
            'Publicação e manutenção de aplicativos em Google Play e App Store.',
      },
    ];

    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 16),
      child: SizedBox(
        child: Column(
          children: [
            FadeInDown(
              duration: const Duration(milliseconds: 600),
              child: const Text(
                'Serviços',
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
                return Wrap(
                  spacing: 32,
                  runSpacing: 32,
                  alignment: WrapAlignment.center,
                  children: List.generate(services.length, (index) {
                    return FadeInUp(
                      duration: const Duration(milliseconds: 600),
                      delay: Duration(milliseconds: 200 + (index * 100)),
                      child: _ServiceCard(
                        icon: services[index]['icon'] as IconData,
                        title: services[index]['title'] as String,
                        description: services[index]['description'] as String,
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
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final double width;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.width,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: widget.width,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
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
          children: [
            Icon(widget.icon, size: 32, color: AppColors.primary),
            const SizedBox(height: 16),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.description,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textMuted,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
