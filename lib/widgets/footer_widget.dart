import 'package:flutter/material.dart';
import 'package:portifolio_linykeer_almeida/widgets/nav_button.dart';
import '../utils/app_colors.dart';

class FooterWidget extends StatelessWidget {
  final Function(String) onNavigate;
  const FooterWidget({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(
          top: BorderSide(color: AppColors.surfaceLight, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
      child: SizedBox(
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 768;
                return Wrap(
                  spacing: isMobile ? 0 : 64,
                  runSpacing: 32,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: isMobile ? constraints.maxWidth : 300,
                      child: const _FooterSection(
                        title: 'Sobre',
                        children: [
                          Text(
                            'Desenvolvedor apaixonado por criar experiências digitais únicas e impactantes.',
                            style: TextStyle(
                              color: AppColors.textMuted,
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: isMobile ? constraints.maxWidth : 200,
                      child: _FooterSection(
                        title: 'Links Rápidos',
                        children: [
                          NavButton('Início', () => onNavigate('home')),
                          const SizedBox(width: 32),
                          NavButton('Sobre', () => onNavigate('about')),
                          const SizedBox(width: 32),
                          NavButton('Serviços', () => onNavigate('services')),
                          const SizedBox(width: 32),
                          NavButton('Projetos', () => onNavigate('projects')),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: isMobile ? constraints.maxWidth : 200,
                      child: const _FooterSection(
                        title: 'Redes Sociais',
                        children: [_SocialLinks()],
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 32),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.surfaceLight, width: 1),
                ),
              ),
              padding: const EdgeInsets.only(top: 32),
              child: Text(
                '© $currentYear Linykeer Almeida. Todos os direitos reservados.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FooterSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _FooterSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }
}

class _SocialLinks extends StatelessWidget {
  const _SocialLinks();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        _SocialButton(icon: Icons.code, onTap: () {}),
        const SizedBox(width: 10),
        _SocialButton(icon: Icons.work, onTap: () {}),
        const SizedBox(width: 10),
        _SocialButton(icon: Icons.alternate_email, onTap: () {}),
      ],
    );
  }
}

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialButton({required this.icon, required this.onTap});

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.primary : AppColors.surfaceLight,
            shape: BoxShape.circle,
          ),
          child: Icon(widget.icon, size: 20, color: AppColors.textPrimary),
        ),
      ),
    );
  }
}
