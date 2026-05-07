import 'package:flutter/material.dart';
import '../utils/app_colors.dart';


class HeaderWidget extends StatefulWidget {
  final Function(String) onNavigate;
  const HeaderWidget({super.key, required this.onNavigate});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  bool _isMenuOpen = false;
  String _activeSection = 'home';

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1024;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.85),
        border: Border(
          bottom: BorderSide(color: Colors.white.withValues(alpha: 0.06), width: 1),
        ),
      ),
      child: ClipRect(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 56,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          widget.onNavigate('home');
                        },
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: '< ',
                                style: TextStyle(
                                  color: Color(0xFF6366F1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'monospace',
                                ),
                              ),
                              TextSpan(
                                text: 'Linykeer',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: ' />',
                                style: TextStyle(
                                  color: Color(0xFF6366F1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'monospace',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      if (!isMobile)
                        Row(
                          children: [
                            _buildNavItem('Início', 'home'),
                            const SizedBox(width: 4),
                            _buildNavItem('Sobre', 'about'),
                            const SizedBox(width: 4),
                            _buildNavItem('Skills', 'skills'),
                            const SizedBox(width: 4),
                            _buildNavItem('Experiência', 'experience'),
                            const SizedBox(width: 4),
                            _buildNavItem('Projetos', 'projects'),
                            const SizedBox(width: 4),
                            _buildNavItem('Contato', 'footer'),
                          ],
                        )
                      else
                        IconButton(
                          icon: Icon(
                            _isMenuOpen ? Icons.close : Icons.menu,
                            color: AppColors.textPrimary,
                          ),
                          onPressed: () => setState(() => _isMenuOpen = !_isMenuOpen),
                        ),
                    ],
                  ),
                ),
              ),

              if (isMobile && _isMenuOpen)
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    border: Border(
                      top: BorderSide(color: Colors.white.withValues(alpha: 0.06), width: 1),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMobileNavItem('Início', 'home'),
                      _buildMobileNavItem('Sobre', 'about'),
                      _buildMobileNavItem('Skills', 'skills'),
                      _buildMobileNavItem('Experiência', 'experience'),
                      _buildMobileNavItem('Projetos', 'projects'),
                      _buildMobileNavItem('Contato', 'footer'),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String label, String section) {
    final isActive = _activeSection == section;
    return InkWell(
      onTap: () {
        setState(() => _activeSection = section);
        widget.onNavigate(section);
      },
      borderRadius: BorderRadius.circular(8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: isActive
              ? Border.all(color: Colors.white.withValues(alpha: 0.1))
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : const Color(0xFF94A3B8),
            fontSize: 14,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildMobileNavItem(String label, String section) {
    return InkWell(
      onTap: () {
        setState(() {
          _activeSection = section;
          _isMenuOpen = false;
        });
        widget.onNavigate(section);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Text(
          label,
          style: TextStyle(
            color: _activeSection == section ? Colors.white : const Color(0xFF94A3B8),
            fontSize: 16,
            fontWeight: _activeSection == section ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
