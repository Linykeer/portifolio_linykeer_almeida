import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../utils/app_colors.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 16),
      child: SizedBox(
        child: Column(
          children: [
            FadeInDown(
              duration: const Duration(milliseconds: 600),
              child: const Text(
                'Sobre mim',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            const SizedBox(height: 48),
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width / 1.7,
              ),
              child: Column(
                children: [
                  FadeInUp(
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 200),
                    child: Column(
                      children: [
                        Text(
                          'Desenvolvedor Mobile Pleno com experiência sólida no ecossistema Flutter, atuando no '
                          'desenvolvimento de aplicativos híbridos com foco em performance, escalabilidade e boa experiência '
                          'do usuário. ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 16,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Possuo vivência em integração de APIs REST, gerenciamento de estado (MobX, Provider, '
                          'Modular, GetX), consumo e persistência de dados locais (Hive, SQLite), além de publicação e '
                          'manutenção de apps em Google Play e App Store. '
                          'Tenho facilidade em trabalhar em equipe, aplicar boas práticas de código e versionamento com Git. '
                          'Busco sempre aprimorar minhas habilidades e contribuir para a entrega de soluções de impacto, com '
                          'qualidade e inovação',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 16,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
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
