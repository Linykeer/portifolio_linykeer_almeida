import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:portifolio_linykeer_almeida/widgets/nav_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/app_colors.dart';

class FooterWidget extends StatelessWidget {
  final Function(String) onNavigate;
  const FooterWidget({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
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
                            'Desenvolvedor Mobile Pleno com experiência sólida no ecossistema Flutter, atuando no '
                            'desenvolvimento de aplicativos híbridos com foco em performance, escalabilidade e boa experiência '
                            'do usuário. Possuo vivência em integração de APIs REST, gerenciamento de estado (MobX, Provider, '
                            'Modular, GetX), consumo e persistência de dados locais (Hive, SQLite), além de publicação e '
                            'manutenção de apps em Google Play e App Store. '
                            'Tenho facilidade em trabalhar em equipe, aplicar boas práticas de código e versionamento com Git. '
                            'Busco sempre aprimorar minhas habilidades e contribuir para a entrega de soluções de impacto, com '
                            'qualidade e inovação',
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
                          NavButton(
                            'Habilidades e Conhecimentos',
                            () => onNavigate('skils'),
                          ),
                          const SizedBox(width: 32),
                          NavButton('Serviços', () => onNavigate('services')),
                          const SizedBox(width: 32),
                          NavButton('Projetos', () => onNavigate('projects')),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: isMobile ? constraints.maxWidth : 200,
                          child: const _FooterSection(
                            title: 'Redes Sociais',
                            children: [_SocialLinks(isContact: false)],
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: isMobile ? constraints.maxWidth : 200,
                          child: const _FooterSection(
                            title: 'Contato',
                            children: [_SocialLinks(isContact: true)],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
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
  final bool isContact;

  const _SocialLinks({required this.isContact});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        if (!isContact)
          _SocialButton(
            icon: FontAwesomeIcons.linkedin,
            iconColor: Color(0xFF0077B5),
            onTap: () async {
              final Uri uri = Uri.parse(
                'https://www.linkedin.com/in/linykeeralmeida/',
              );
              if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                throw 'Não foi possível abrir $uri';
              }
            },
          ),
        if (!isContact) const SizedBox(width: 10),
        if (!isContact)
          _SocialButton(
            icon: FontAwesomeIcons.github,
            iconColor: Colors.white,
            onTap: () async {
              final Uri uri = Uri.parse('https://github.com/linykeer');
              if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                throw 'Não foi possível abrir $uri';
              }
            },
          ),
        if (isContact)
          _SocialButton(
            icon: LucideIcons.mail,
            iconColor: Colors.grey,
            onTap: () async {
              final Uri uri = Uri(
                scheme: 'mailto',
                path: 'contato@linykeer.com.br',
              );
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              } else {
                throw 'Não foi possível abrir o cliente de e-mail.';
              }
            },
          ),
      ],
    );
  }
}

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color iconColor;

  const _SocialButton({
    required this.icon,
    required this.onTap,
    required this.iconColor,
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 40,
        height: 40,

        child: FaIcon(widget.icon, size: 32, color: widget.iconColor),
      ),
    );
  }
}
