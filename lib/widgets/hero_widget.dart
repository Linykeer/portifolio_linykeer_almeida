import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeroWidgetModern extends StatelessWidget {
  final VoidCallback? callback;
  const HeroWidgetModern({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width < 1024;
    final paddingHorizontal = isTablet ? 24.0 : 140.0;

    return Container(
      constraints: isTablet
          ? null 
          : BoxConstraints(minHeight: MediaQuery.of(context).size.height),
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Stack(
        children: [
          Positioned(
            top: 200,
            right: isTablet ? -60 : 80,
            child: RepaintBoundary(
              child: Container(
                width: isTablet ? 260 : 380,
                height: isTablet ? 260 : 380,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF6366F1).withValues(alpha: 0.4),
                      const Color(0xFF6366F1).withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 200,
            left: isTablet ? -60 : 80,
            child: RepaintBoundary(
              child: Container(
                width: isTablet ? 260 : 380,
                height: isTablet ? 260 : 380,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF8B5CF6).withValues(alpha: 0.4),
                      const Color(0xFF8B5CF6).withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              top: 80,
              left: paddingHorizontal,
              right: paddingHorizontal,
              bottom: 40,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: isTablet ? _buildMobile(context) : _buildDesktop(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 150),
              child: _buildTextContent(context),
            ),
          ),
          const SizedBox(width: 48),
          Expanded(
            child: SizedBox(
              height: 650,
              child: _buildProfileVisual(context, 500.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32),
          child: _buildTextContent(context),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 320,
          child: _buildProfileVisual(context, 300.0),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: _ButtonsContact(callback: callback).animate().fadeIn(delay: 600.ms).slideY(begin: 0.1, end: 0, duration: 500.ms),
        ),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1024;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF241A3C),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF3B1D6E).withValues(alpha: 0.5)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF8B5CF6),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Disponível para projetos',
                style: TextStyle(color: Color(0xFFA78BFA), fontSize: 13),
              ),
            ],
          ),
        ).animate().fadeIn(delay: 200.ms),
        const SizedBox(height: 24),
        _buildAnimatedTitle(isMobile),
        const SizedBox(height: 20),
        Text(
          isMobile
              ? 'Especialista em desenvolvimento Flutter, focado em criar apps de alta performance e design premium. Transformo visões em experiências fluidas e escaláveis.'
              : 'Especialista em desenvolvimento Flutter, focado em criar aplicativos de alta\nperformance e design premium. Transformo visões em experiências\nmóveis fluidas, escaláveis e publicadas nas lojas.',
          style: TextStyle(color: Colors.white60, fontSize: isMobile ? 15 : 18, height: 1.6),
        ).animate().fadeIn(delay: 500.ms),
        SizedBox(height: isMobile ? 32 : 48),
        if (!isMobile)  _ButtonsContact(callback: callback ).animate().fadeIn(delay: 600.ms).slideX(begin: -0.05, end: 0, duration: 500.ms),
        if (!isMobile) const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildProfileVisual(BuildContext context, double size) {
     final isMobile = MediaQuery.of(context).size.width < 1024;
    return Center(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: size - 40,
            height: size - 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF8B5CF6).withValues(alpha: 0.25),
                width: 1.5,
              ),
            ),
          ),

          Container(
            width: size - 80,
            height: size - 80,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF8B5CF6), Color(0xFF3B82F6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF8B5CF6).withValues(alpha: 0.25),
                  blurRadius: 30,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/image.jpeg',
                fit: BoxFit.contain,
                cacheHeight: 600,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded || frame != null) {
                    return AnimatedOpacity(
                      opacity: 1.0,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeOut,
                      child: child,
                    );
                  }
                  // Placeholder enquanto decodifica
                  return const SizedBox.expand();
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.person, size: 80, color: Colors.white24),
                  );
                },
              ),
            ),
          ),
        
          Positioned(
            top: 80,
            right: 0,
            child: _buildBadge(
              icon: Icons.code,
              iconColor: const Color(0xFF8B5CF6),
              title: 'Flutter',
              subtitle: 'Mobile',
            ).animate().fadeIn(delay: 600.ms).slideX(begin: 0.2, end: 0, delay: 600.ms),
          ),
          Positioned(
            bottom:!isMobile? 200: 80,
            left: !isMobile ? -20: -10,
            child: _buildBadge(
              icon: Icons.star,
              iconColor: const Color(0xFFFBBF24),
              title: '4+ anos',
              subtitle: 'Experiência Mobile',
            ).animate().fadeIn(delay: 800.ms).slideX(begin: -0.2, end: 0, delay: 800.ms),
          ),
            Positioned(
            bottom: 30,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF16161D),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFF10B981),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Open to work',
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 4),
                  const Text('🇧🇷', style: TextStyle(fontSize: 12)),
                ],
              ),
            ).animate().fadeIn(delay: 1000.ms).slideY(begin: 0.2, end: 0, delay: 1000.ms),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF16161D),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor, size: 16),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.6),
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedTitle(bool isMobile) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1500),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return ClipRect(
          child: Align(
            alignment: Alignment.centerLeft,
            widthFactor: value,
            child: child,
          ),
        );
      },
      child: Text.rich(
        const TextSpan(
          children: [
            TextSpan(text: 'Oi, eu sou '),
            TextSpan(
              text: 'Linykeer',
              style: TextStyle(color: Color(0xFF8B5CF6)),
            ),
          ],
        ),
        style: TextStyle(
          fontSize: isMobile ? 36 : 56,
          fontWeight: FontWeight.w800,
          color: Colors.white,
          height: 1.1,
        ),
      ),
    );
  }
}

class _ButtonsContact extends StatelessWidget {
  final VoidCallback? callback;
  const _ButtonsContact({required this.callback});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 16,
          runSpacing: 16,
          children: [
            ElevatedButton.icon(
              onPressed: callback,
              icon: const Text('Ver Projetos', style: TextStyle(fontWeight: FontWeight.w600)),
              label: const Icon(Icons.open_in_new, size: 16),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6366F1),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () async {
                final Uri emailUri = Uri(
                  scheme: 'mailto',
                  path: 'linykeeralmeida@gmail.com',
                  queryParameters: {'subject': 'Contato via Portfólio'},
                );
                if (await canLaunchUrl(emailUri)) {
                  await launchUrl(emailUri);
                }
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Entrar em Contato', style: TextStyle(fontWeight: FontWeight.w500)),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSocialIcon(FontAwesomeIcons.github, 'https://github.com/linykeer'),
            const SizedBox(width: 12),
            _buildSocialIcon(FontAwesomeIcons.linkedinIn, 'www.linkedin.com/in/linykeeralmeida'),
            const SizedBox(width: 12),
            _buildSocialIcon(FontAwesomeIcons.envelope, 'mailto:linykeeralmeida@gmail.com'),
           
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFF16161D),
          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.white70, size: 18),
      ),
    );
  }
}
