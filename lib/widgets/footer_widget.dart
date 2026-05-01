import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/app_colors.dart';

class FooterWidget extends StatelessWidget {
  final Function(String) onNavigate;
  const FooterWidget({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    final isMobile = MediaQuery.of(context).size.width < 1024;
    final paddingHorizontal = isMobile ? 24.0 : 120.0;

    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: paddingHorizontal),
      child: Column(
        children: [
          const Text(
            'CONTATO',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
              color: Color(0xFF6366F1),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Vamos conversar?',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Estou aberta a novas oportunidades e colaborações. Entre\nem contato!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF64748B),
              fontSize: 15,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 56),

          if (isMobile)
            Column(
              children: [
                _buildContactInfo(),
                const SizedBox(height: 40),
                _buildContactForm(),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: _buildContactInfo()),
                const SizedBox(width: 48),
                Expanded(flex: 7, child: _buildContactForm()),
              ],
            ),

          const SizedBox(height: 64),

          Container(
            padding: const EdgeInsets.only(top: 24),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.white.withValues(alpha: 0.06), width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '© $currentYear Linykeer Almeida',
                  style: const TextStyle(color: Color(0xFF475569), fontSize: 13),
                ),
                if (!isMobile)
                  const Text(
                    '< Dart + Flutter />',
                    style: TextStyle(
                      color: Color(0xFF475569),
                      fontSize: 13,
                      fontFamily: 'monospace',
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoTile(
          icon: Icons.email_outlined,
          title: 'E-mail',
          value: 'linykeeralmeida@gmail.com',
          onTap: () async {
            final Uri uri = Uri(scheme: 'mailto', path: 'linykeeralmeida@gmail.com');
            if (await canLaunchUrl(uri)) await launchUrl(uri);
          },
        ),
        const SizedBox(height: 12),
        _buildInfoTile(
          icon: Icons.location_on_outlined,
          title: 'Localização',
          value: 'Brasil 🇧🇷',
        ),
        const SizedBox(height: 32),
        const Text(
          'REDES SOCIAIS',
          style: TextStyle(
            color: Color(0xFF475569),
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            _buildSocialIcon(FontAwesomeIcons.github, 'https://github.com/linykeer'),
            const SizedBox(width: 10),
            _buildSocialIcon(FontAwesomeIcons.linkedinIn, 'https://www.linkedin.com/in/linykeeralmeida/'),
            const SizedBox(width: 10),
            _buildSocialIcon(FontAwesomeIcons.envelope, 'mailto:linykeeralmeida@gmail.com'),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    required String value,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF6366F1).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: const Color(0xFF6366F1), size: 20),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Color(0xFF64748B), fontSize: 12)),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) await launchUrl(uri);
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: const Color(0xFF94A3B8), size: 17),
      ),
    );
  }

  Widget _buildContactForm() {
    TextEditingController controllerName = TextEditingController();
    TextEditingController controllerEmail = TextEditingController();
    TextEditingController controllerMessage = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel('Seu nome'),
            const SizedBox(height: 6),
            _buildInput('Linykeer', controllerName),
            const SizedBox(height: 20),
            _buildLabel('Seu e-mail'),
            const SizedBox(height: 6),
            _buildInput('seu@email.com', controllerEmail),
            const SizedBox(height: 20),
            _buildLabel('Mensagem'),
            const SizedBox(height: 6),
            _buildInput('Olá, adorei seu portfólio! Quero conversar sobre...', maxLines: 4, controllerMessage),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () async{
                  if(formKey.currentState!.validate()) {
                    final Uri uri = Uri(scheme: 'mailto', path: 'linykeeralmeida@gmail.com');
                    if (await canLaunchUrl(uri)) await launchUrl(uri);
                  }
                },
                icon: const Icon(Icons.send, size: 16),
                label: const Text(
                  'Enviar mensagem',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6366F1),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFFCBD5E1),
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildInput(String hint, TextEditingController controller, {int maxLines = 1}) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Este campo é obrigatório';
        }
        return null;
      },
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white, fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFF334155), fontSize: 14),
        filled: true,
        fillColor: AppColors.background,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.06)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF6366F1), width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      ),
    );
  }
}
