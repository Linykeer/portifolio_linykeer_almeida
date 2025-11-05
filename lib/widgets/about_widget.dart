import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../utils/app_colors.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
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
                maxWidth: MediaQuery.sizeOf(context).width - 60,
              ),
              child: Column(
                children: [
                  FadeInUp(
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 200),
                    child: const Text(
                      'Sou um desenvolvedor apaixonado por criar soluções digitais inovadoras. '
                      'Com anos de experiência no desenvolvimento web, tenho ajudado empresas e '
                      'empreendedores a transformar suas ideias em realidade através de código limpo '
                      'e design intuitivo.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 16,
                        height: 1.6,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  FadeInUp(
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 400),
                    child: const Text(
                      'Minha abordagem combina conhecimento técnico profundo com uma compreensão '
                      'aguçada das necessidades do usuário, resultando em produtos que não apenas '
                      'funcionam perfeitamente, mas também encantam.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 16,
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 64),
          ],
        ),
      ),
    );
  }
}
