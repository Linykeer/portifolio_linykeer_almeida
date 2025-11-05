import 'package:flutter/material.dart';
import 'package:portifolio_linykeer_almeida/widgets/nav_button.dart';
import '../utils/app_colors.dart';

class HeaderWidget extends StatefulWidget {
  final Function(String) onNavigate;

  const HeaderWidget({super.key, required this.onNavigate});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.8),
        border: const Border(
          bottom: BorderSide(color: AppColors.surfaceLight, width: 1),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => widget.onNavigate('home'),
                    child: const Text(
                      'Linykeer Almeida',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  if (!isMobile)
                    Row(
                      children: [
                        NavButton('Início', () => widget.onNavigate('home')),
                        const SizedBox(width: 32),
                        NavButton('Sobre', () => widget.onNavigate('about')),
                        const SizedBox(width: 32),
                        NavButton(
                          'Serviços',
                          () => widget.onNavigate('services'),
                        ),
                        const SizedBox(width: 32),
                        NavButton(
                          'Projetos',
                          () => widget.onNavigate('projects'),
                        ),
                        const SizedBox(width: 32),
                        NavButton('Meu Curriculo', () {}),
                      ],
                    )
                  else
                    IconButton(
                      icon: Icon(
                        _isMenuOpen ? Icons.close : Icons.menu,
                        color: AppColors.textPrimary,
                      ),
                      onPressed: () {
                        setState(() {
                          _isMenuOpen = !_isMenuOpen;
                        });
                      },
                    ),
                ],
              ),
            ),

            if (isMobile && _isMenuOpen)
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: AppColors.surfaceLight, width: 1),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NavButton('Início', () {
                      widget.onNavigate('home');
                      setState(() => _isMenuOpen = false);
                    }),
                    const SizedBox(height: 16),
                    NavButton('Sobre', () {
                      widget.onNavigate('about');
                      setState(() => _isMenuOpen = false);
                    }),
                    const SizedBox(height: 16),
                    NavButton('Serviços', () {
                      widget.onNavigate('services');
                      setState(() => _isMenuOpen = false);
                    }),
                    const SizedBox(height: 16),
                    NavButton('Projetos', () {
                      widget.onNavigate('projects');
                      setState(() => _isMenuOpen = false);
                    }),
                    const SizedBox(height: 16),
                    NavButton('Meu Curriculo', () {
                      setState(() => _isMenuOpen = false);
                    }),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
