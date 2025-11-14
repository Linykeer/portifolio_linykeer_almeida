import 'dart:math';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:marquee/marquee.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web/web.dart' as web;

import '../utils/app_colors.dart';

class HeroWidgetModern extends StatefulWidget {
  const HeroWidgetModern({super.key});

  @override
  State<HeroWidgetModern> createState() => _HeroWidgetModernState();
}

class _HeroWidgetModernState extends State<HeroWidgetModern>
    with TickerProviderStateMixin {
  late final AnimationController _bgRotateController;
  late final AnimationController _bgRotateController2;
  late final AnimationController _profilePulseController;

  final List<String> techStack = [
    'Publicação App Store',
    'Dart',
    'Flutter',
    'React',
    'TypeScript',
    'Firebase',
    'Git',
    'Gihub',
    'Arquitetura MVC',
    'Modular',
    'MobX',
    'GetX',
    'Provider',
    'Figma',
    'Hive/SQLite',
    'Publicação Google Play',
    'Publicação Apple Store',
  ];

  @override
  void initState() {
    super.initState();
    _bgRotateController = AnimationController(
      vsync: this,
      duration: const Duration(minutes: 1),
    )..repeat();
    _bgRotateController2 = AnimationController(
      vsync: this,
      duration: const Duration(minutes: 1),
    )..repeat(reverse: false);
  }

  @override
  void dispose() {
    _bgRotateController.dispose();
    _bgRotateController2.dispose();
    _profilePulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width < 1024;

    final paddingHorizontal = isTablet ? 24.0 : 140.0;

    return Container(
      constraints: const BoxConstraints(minHeight: 600),
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [AppColors.background, Color(0xFF0F172A)],
          center: Alignment(0.8, -0.5),
          radius: 1.4,
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Stack(
              children: [
                _AnimatedBlob(
                  controller: _bgRotateController,
                  top: 250,
                  right: isTablet ? -60 : 120,
                  size: isTablet ? 260 : 380,
                  color: Colors.blue.withValues(alpha: 0.08),
                ),
                _AnimatedBlob(
                  controller: _bgRotateController2,
                  bottom: 250,
                  left: isTablet ? -60 : 120,
                  size: isTablet ? 260 : 380,
                  color: Colors.purple.withValues(alpha: 0.08),
                ),
              ],
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

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.3),
                    Colors.transparent,
                  ],
                ),
              ),
              height: 64,
              child: _buildMarquee(),
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
            child: FadeInLeft(
              duration: 800.ms,
              child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: _buildTextContent(context),
              ),
            ),
          ),
          const SizedBox(width: 48),
          Expanded(
            child: FadeInRight(
              duration: 800.ms,
              child: SizedBox(
                height: 650,
                child: _buildProfileVisual(context, 500.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: FadeInUp(duration: 800.ms, child: _buildTextContent(context)),
        ),
        FadeInDown(
          duration: 800.ms,
          child: SizedBox(
            height: 420,
            child: _buildProfileVisual(context, 400.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 48),
          child: _ButtonsContact(),
        ),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1024;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Olá, Meu nome é',
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ).animate().fadeIn(delay: 200.ms),
        const SizedBox(height: 6),
        ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                  colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)],
                ).createShader(Rect.fromLTWH(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.srcIn,
              child: Text(
                'Linykeer Almeida',
                style: TextStyle(
                  fontSize: isMobile ? 28 : 42,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.1,
                ),
              ),
            )
            .animate()
            .fadeIn(delay: 300.ms)
            .slide(delay: 300.ms, begin: const Offset(0, 0.02)),
        const SizedBox(height: 8),
        Text(
          'Desenvolvedor Mobile Flutter',
          style: TextStyle(
            fontSize: isMobile ? 20 : 24,
            color: Colors.white70,
            fontWeight: FontWeight.w500,
          ),
        ).animate().fadeIn(delay: 400.ms),
        const SizedBox(height: 20),
        Text(
          'Sou apaixonado por criar apps que unem design, desempenho e propósito. Acredito que cada linha de código pode transformar uma boa ideia em uma experiência digital inesquecível.',
          style: TextStyle(color: Colors.white60, fontSize: isMobile ? 15 : 17),
        ).animate().fadeIn(delay: 500.ms),
        SizedBox(height: isMobile ? 24 : 60),
        if (!isMobile) _ButtonsContact(),
        if (!isMobile) const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildProfileVisual(BuildContext context, double size) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _bgRotateController2,
            builder: (context, child) {
              return Transform.rotate(
                angle: -_bgRotateController2.value * 2 * pi,
                child: CustomPaint(
                  size: Size(size - 40, size - 40),
                  painter: _CirclePainter(
                    strokeWidth: 2,
                    dash: 20,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8B5CF6), Color(0xFF3B82F6)],
                    ),
                  ),
                ),
              );
            },
          ),

          Container(
            width: size - 80,
            height: size - 80,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.4),
                  blurRadius: 2,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipOval(
              child: Container(
                color: Colors.grey[900],
                child: Image.asset(
                  'assets/image.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.person,
                        size: 80,
                        color: Colors.white24,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMarquee() {
    final combined = [...techStack, ...techStack];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Marquee(
        text: combined.map((e) => '• $e     ').join(),
        style: const TextStyle(color: Colors.white70, fontSize: 15),
        blankSpace: 2,
        textDirection: TextDirection.rtl,
        velocity: 15.0,
        pauseAfterRound: Duration.zero,
      ),
    );
  }
}

class _AnimatedBlob extends StatelessWidget {
  final AnimationController controller;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final double size;
  final Color color;

  const _AnimatedBlob({
    required this.controller,
    this.top,
    this.left,
    this.right,
    this.bottom,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          final s = 1 + 0.12 * sin(controller.value * 2 * pi);
          return Transform.scale(scale: s, child: child);
        },
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: Container(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}

class _ButtonsContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 16,
      runSpacing: 16,
      children: [
        SizedBox(
          width: 200,
          child: ElevatedButton.icon(
            onPressed: () async {
              final Uri emailUri = Uri(
                scheme: 'mailto',
                path: 'contato@linykeer.com.br',
                queryParameters: {'subject': 'Contato via Portfólio'},
              );

              if (await canLaunchUrl(emailUri)) {
                await launchUrl(emailUri);
              } else {
                throw 'Não foi possível abrir o cliente de e-mail';
              }
            },
            icon: Icon(Icons.mail, size: 20),
            label: Text('Contato'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 200,
          child: OutlinedButton.icon(
            onPressed: () {
              const pdfPath = 'assets/curriculo_linykeer_almeida.pdf';

              web.HTMLAnchorElement()
                ..href = pdfPath
                ..download = 'curriculo_linykeer_almeida.pdf'
                ..click();
            },
            icon: Icon(Icons.download, size: 20),
            label: Text('Baixar Curriculo'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: AppColors.border),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CirclePainter extends CustomPainter {
  final double strokeWidth;
  final double dash;
  final Gradient gradient;

  _CirclePainter({
    required this.strokeWidth,
    required this.dash,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = min(size.width, size.height) / 2 - strokeWidth;

    final rect = Rect.fromCircle(center: center, radius: radius);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round;

    const double gap = 10;
    final circumference = 2 * pi * radius;
    final dashLen = dash;
    final gapLen = gap;
    double current = 0;
    while (current < circumference) {
      final startAngle = (current / circumference) * 2 * pi;
      final sweepAngle = (dashLen / circumference) * 2 * pi;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
      current += dashLen + gapLen;
    }
  }

  @override
  bool shouldRepaint(covariant _CirclePainter oldDelegate) => false;
}
