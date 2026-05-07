import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_colors.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1024;
    final paddingHorizontal = isMobile ? 16.0 : 120.0;

    return Container(
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
            'Quem é Linykeer?',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ).animate().fadeIn(duration: 600.ms).slideY(begin: -0.05, end: 0, duration: 600.ms),
          const SizedBox(height: 48),
          if (isMobile) _buildMobileLayout(context) else _buildDesktopLayout(context),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: _buildImageSection()
              .animate()
              .fadeIn(duration: 800.ms)
              .slideX(begin: -0.05, end: 0, duration: 800.ms),
        ),
        const SizedBox(width: 48),
        Expanded(
          flex: 7,
          child: _buildContentSection(context)
              .animate()
              .fadeIn(duration: 800.ms, delay: 150.ms)
              .slideX(begin: 0.05, end: 0, duration: 800.ms, delay: 150.ms),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildImageSection()
            .animate()
            .fadeIn(duration: 800.ms)
            .slideY(begin: 0.05, end: 0, duration: 800.ms),
        const SizedBox(height: 48),
        _buildContentSection(context)
            .animate()
            .fadeIn(duration: 800.ms, delay: 200.ms)
            .slideY(begin: 0.05, end: 0, duration: 800.ms, delay: 200.ms),
      ],
    );
  }

  Widget _buildImageSection() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: AppColors.surface,
            height: 580,
            child: Image.asset(
              'assets/image.jpg',
              fit: BoxFit.fitHeight,
              cacheHeight: 800,
              errorBuilder: (context, error, stackTrace) {
                return const Center(child: Icon(Icons.person, size: 80, color: Colors.white24));
              },
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF13131A).withValues(alpha: 0.97),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'const dev = {',
                  style: TextStyle(fontFamily: 'monospace', color: Color(0xFF8B5CF6), fontSize: 12),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 14, top: 3, bottom: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("  name: 'Linykeer',", style: TextStyle(fontFamily: 'monospace', color: Color(0xFF93C5FD), fontSize: 12)),
                      Text("  focus: 'Mobile',", style: TextStyle(fontFamily: 'monospace', color: Color(0xFF34D399), fontSize: 12)),
                    ],
                  ),
                ),
                Text(
                  '};',
                  style: TextStyle(fontFamily: 'monospace', color: Color(0xFF8B5CF6), fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContentSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Desenvolvedor Mobile com mais de 5 anos de experiência, especializado em Flutter e Dart. '
          'Trabalho com gerenciamento de estado avançado (MobX, BloC, Provider, GetX, Modular) '
          'e persistência local (Hive, SQLite). Transformo conceitos visuais em interfaces '
          'de alta fidelidade com performance fluida, garantindo uma experiência de usuário '
          'premium através de animações refinadas e precisão técnica.',
          style: TextStyle(
            color: Color(0xFFCBD5E1),
            fontSize: 15,
            height: 1.75,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Tenho ciclo completo de entrega: do design no Figma ao deploy nas lojas (App Store e Google Play). '
          'Com mais de 1 ano e meio de experiência em React e TypeScript, atuo também no frontend web. '
          'Domínio de Firebase, Supabase, REST APIs e arquitetura limpa orientada a escalabilidade.',
          style: TextStyle(
            color: Color(0xFF94A3B8),
            fontSize: 15,
            height: 1.75,
          ),
        ),
        const SizedBox(height: 40),
        LayoutBuilder(builder: (context, constraints) {
          final cardWidth = (constraints.maxWidth - 16) / 2;
          return Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              SizedBox(
                width: cardWidth,
                child: _buildInfoCard(
                  icon: Icons.layers_outlined,
                  iconColor: const Color(0xFF8B5CF6),
                  title: 'Arquitetura Limpa',
                  description: 'Aplicações modulares e escaláveis com foco em padrões arquiteturais (Clean Architecture).',
                  context: context
                ),
              ),
              SizedBox(
                width: cardWidth,
                child: _buildInfoCard(
                  icon: Icons.touch_app_outlined,
                  iconColor: const Color(0xFF3B82F6),
                  title: 'UI/UX Nativa',
                  description: 'Animações fluidas a 60fps e interfaces pixel-perfect responsivas em qualquer tamanho de tela.',
                  context: context
                ),
              ),
              SizedBox(
                width: cardWidth,
                child: _buildInfoCard(
                  icon: Icons.speed,
                  iconColor: const Color(0xFFF59E0B),
                  title: 'Alta Performance',
                  description: 'Gestão eficiente de estado (MobX, Bloc), reduzindo consumo de bateria e memória.',
                       context: context
                ),
              ),
              SizedBox(
                width: cardWidth,
                child: _buildInfoCard(
                  icon: Icons.rocket_launch_outlined,
                  iconColor: const Color(0xFFEC4899),
                  title: 'Ponta a Ponta',
                  description: 'Do código à publicação nas lojas (Apple Store e Google Play) lidando com CI/CD.',
                       context: context
                ),
              ),
            ],
          );
        }),
      ],
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
    required BuildContext context
  }) {
    final isMobile = MediaQuery.of(context).size.width < 1024;
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: isMobile ? 280 : 180),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(height: 14),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                color: Color(0xFF94A3B8),
                fontSize: 13,
                height: 1.55,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
