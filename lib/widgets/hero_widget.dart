import 'package:url_launcher/url_launcher.dart';
import 'package:web/web.dart' as web;

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../utils/app_colors.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1024;

    return Container(
      padding: EdgeInsets.only(
        top: 150,
        left: isMobile ? 32 : 150,
        right: isMobile ? 32 : 150,
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: isMobile
            ? _buildMobileLayout(context)
            : _buildDesktopLayout(context),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: FadeInLeft(
              duration: const Duration(milliseconds: 800),
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: _buildTextContent(context),
              ),
            ),
          ),
          const SizedBox(width: 48),
          Expanded(
            child: FadeInRight(
              duration: const Duration(milliseconds: 800),
              child: SizedBox(
                height: 650,
                child: Image.asset('assets/image.png', fit: BoxFit.contain),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 800),
          child: SizedBox(
            height: 450,
            child: Image.asset('assets/image.png', fit: BoxFit.contain),
          ),
        ),
        const SizedBox(height: 48),
        FadeInUp(
          duration: const Duration(milliseconds: 800),
          child: _buildTextContent(context),
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
          style: TextStyle(color: AppColors.textMuted, fontSize: 16),
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: isMobile ? 28 : 42,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              height: 1.2,
            ),
            children: [
              TextSpan(
                text: 'Linykeer Almeida',
                style: TextStyle(color: AppColors.primary),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Desenvolvedor Mobile Flutter',
          style: TextStyle(
            fontSize: 24,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          'Sou apaixonado por criar apps que unem design, desempenho e propósito. Acredito que cada linha de código pode transformar uma boa ideia em uma experiência digital inesquecível.',
          style: TextStyle(
            color: AppColors.textMuted,
            fontSize: 17,
            letterSpacing: 0.1,
          ),
        ),
        SizedBox(height: isMobile ? 32 : 250),
        Wrap(
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}
