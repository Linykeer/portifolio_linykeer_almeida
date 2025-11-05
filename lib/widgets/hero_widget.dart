import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../utils/app_colors.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1024;

    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 32),
      child: Align(
        alignment: Alignment.topCenter,
        child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Padding(
      padding: const EdgeInsets.only(left: 150),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: FadeInLeft(
              duration: const Duration(milliseconds: 800),
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: _buildTextContent(),
              ),
            ),
          ),
          const SizedBox(width: 48),
          Expanded(
            child: FadeInRight(
              duration: const Duration(milliseconds: 800),
              child: _buildImageSection(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 800),
          child: _buildImageSection(),
        ),
        const SizedBox(height: 48),
        FadeInUp(
          duration: const Duration(milliseconds: 800),
          child: _buildTextContent(),
        ),
      ],
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Olá,',
          style: TextStyle(color: AppColors.textMuted, fontSize: 16),
        ),
        const SizedBox(height: 16),
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              height: 1.2,
            ),
            children: [
              TextSpan(text: 'Meu nome é '),
              TextSpan(
                text: 'Linykeer Almeida!',
                style: TextStyle(color: AppColors.primary),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Sou Desenvolvedor de Software',
          style: TextStyle(fontSize: 24, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 32),
        const Text(
          'Transformo ideias em experiências digitais incríveis. Especializado em criar '
          'websites modernos e aplicações web de alta performance.',
          style: TextStyle(
            color: AppColors.textMuted,
            fontSize: 16,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildImageSection() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Pulse(
              duration: const Duration(seconds: 3),
              infinite: true,
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      AppColors.primary.withValues(alpha: 0.3),
                      AppColors.secondary.withValues(alpha: 0.2),
                      AppColors.accent.withValues(alpha: 0.2),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Decorative Dots
          Positioned(
            top: -40,
            left: 40,
            child: _DecorativeDot(
              size: 48,
              color: AppColors.primary.withValues(alpha: 0.6),
            ),
          ),
          Positioned(
            bottom: -40,
            right: -40,
            child: _DecorativeDot(
              size: 64,
              color: AppColors.secondary.withValues(alpha: 0.5),
            ),
          ),
          Positioned(
            top: 100,
            left: -32,
            child: _DecorativeDot(
              size: 32,
              color: AppColors.accent.withValues(alpha: 0.7),
            ),
          ),

          Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Image.asset(
              'assets/image.jpeg',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 400,
                  height: 400,
                  color: AppColors.surface,
                  child: const Icon(
                    Icons.person,
                    size: 100,
                    color: AppColors.textMuted,
                  ),
                );
              },
            ),
          ),

          Positioned(
            top: 120,
            left: -64,
            child: _FloatingShape(
              width: 96,
              height: 96,
              rotation: 12,
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.2),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 150,
            right: -48,
            child: _FloatingShape(
              width: 128,
              height: 128,
              rotation: -12,
              gradient: LinearGradient(
                colors: [
                  AppColors.secondary.withValues(alpha: 0.2),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DecorativeDot extends StatelessWidget {
  final double size;
  final Color color;

  const _DecorativeDot({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.2),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
    );
  }
}

class _FloatingShape extends StatelessWidget {
  final double width;
  final double height;
  final double rotation;
  final Gradient gradient;

  const _FloatingShape({
    required this.width,
    required this.height,
    required this.rotation,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotation * 3.14159 / 180,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
      ),
    );
  }
}
