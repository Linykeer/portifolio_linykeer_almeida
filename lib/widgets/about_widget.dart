import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../utils/app_colors.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1024;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0F172A), AppColors.background],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: -60,
            left: -100,
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
            padding: const EdgeInsets.only(
              top: 100,
              bottom: 80,
              left: 16,
              right: 16,
            ),
            child: Column(
              children: [
                FadeInDown(
                  duration: const Duration(milliseconds: 600),
                  child: const Text(
                    'Sobre mim',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 40),

                Container(
                  constraints: BoxConstraints(
                    maxWidth:
                        MediaQuery.sizeOf(context).width /
                        (isMobile ? 1.15 : 1.8),
                  ),
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 200),
                    child: Column(
                      children: [
                        Text(
                          'Desenvolvedor Mobile Pleno com experiência sólida no ecossistema Flutter, atuando no '
                          'desenvolvimento de aplicativos híbridos com foco em performance, escalabilidade e ótima '
                          'experiência do usuário.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 17,
                            height: 1.65,
                          ),
                        ),

                        const SizedBox(height: 14),

                        Text(
                          'Tenho vivência com APIs REST, gerenciamento de estado (MobX, Provider, Modular, GetX) e '
                          'persistência de dados locais (Hive, SQLite). Experiência completa com publicação e manutenção '
                          'de aplicativos em Google Play e App Store, além de forte domínio em boas práticas, arquitetura '
                          'e versionamento com Git. Busco sempre entregar soluções de impacto com qualidade e inovação.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 17,
                            height: 1.65,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
