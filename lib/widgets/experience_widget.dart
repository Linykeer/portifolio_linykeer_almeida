import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_colors.dart';

enum ExperienceType { work, education, achievement }

class ExperienceData {
  final ExperienceType type;
  final String role;
  final String company;
  final String period;
  final String description;
  final List<String> tags;
  final Color dotColor;

  ExperienceData({
    required this.type,
    required this.role,
    required this.company,
    required this.period,
    required this.description,
    required this.tags,
    required this.dotColor,
  });
}

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1024;
    final paddingHorizontal = isMobile ? 24.0 : 120.0;

    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.symmetric(
       vertical: isMobile ? 32 : 50,
        horizontal: paddingHorizontal,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader().animate().fadeIn(duration: 600.ms).slideY(begin: 0.05, end: 0, duration: 600.ms),
          const SizedBox(height: 48),
          _buildStatsGrid(isMobile)
              .animate()
              .fadeIn(duration: 600.ms, delay: 200.ms)
              .slideY(begin: 0.05, end: 0, duration: 600.ms, delay: 200.ms),
          const SizedBox(height: 80),
          _buildTimeline(context, isMobile)
              .animate()
              .fadeIn(duration: 800.ms, delay: 400.ms)
              .slideY(begin: 0.05, end: 0, duration: 800.ms, delay: 400.ms),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'TRAJETÓRIA',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
            color: Color(0xFF8B5CF6),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Experiência & Formação',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Minha jornada no mundo do desenvolvimento — clique em cada card para ver os detalhes.',
          style: TextStyle(
            fontSize: 15,
            color: Colors.white.withValues(alpha: 0.7),
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsGrid(bool isMobile) {
    if (isMobile) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildStatCard('5+', 'Anos de exp.')),
              const SizedBox(width: 16),
              Expanded(child: _buildStatCard('4', 'Empresas')),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildStatCard('15+', 'Projetos')),
            ],
          ),
        ],
      );
    }

    return Row(
      children: [
        Expanded(child: _buildStatCard('5+', 'Anos de exp.')),
        const SizedBox(width: 24),
        Expanded(child: _buildStatCard('4', 'Empresas')),
        const SizedBox(width: 24),
        Expanded(child: _buildStatCard('15+', 'Projetos')),
     
      ],
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8B5CF6),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: Colors.white.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline(BuildContext context, bool isMobile) {
    final data = _getExperienceData();

    return isMobile
        ? _buildMobileTimeline(data)
        : _buildDesktopTimeline(data);
  }

  Widget _buildDesktopTimeline(List<ExperienceData> data) {
    return Stack(
      children: [
        // Linha Central
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF8B5CF6).withValues(alpha: 0),
                    const Color(0xFF8B5CF6).withValues(alpha: 0.5),
                    const Color(0xFF3B82F6).withValues(alpha: 0.5),
                    const Color(0xFF10B981).withValues(alpha: 0),
                  ],
                ),
              ),
            ),
          ),
        ),
        // Cards
        Column(
          children: List.generate(data.length, (index) {
            final isLeft = index % 2 == 0;
            return Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Esquerda
                  Expanded(
                    child: isLeft
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 48),
                              child: ExperienceCard(data: data[index]),
                            ),
                          )
                        : const SizedBox(),
                  ),
                  // Ponto Central
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: data[index].dotColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.background, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: data[index].dotColor.withValues(alpha: 0.5),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                  // Direita
                  Expanded(
                    child: !isLeft
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 48),
                              child: ExperienceCard(data: data[index]),
                            ),
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildMobileTimeline(List<ExperienceData> data) {
    return Stack(
      children: [
        // Linha Lateral
        Positioned(
          top: 0,
          bottom: 0,
          left: 23,
          child: Container(
            width: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF8B5CF6).withValues(alpha: 0),
                  const Color(0xFF8B5CF6).withValues(alpha: 0.5),
                  const Color(0xFF3B82F6).withValues(alpha: 0.5),
                  const Color(0xFF10B981).withValues(alpha: 0),
                ],
              ),
            ),
          ),
        ),
        // Cards
        Column(
          children: List.generate(data.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Ponto
                  Container(
                    margin: const EdgeInsets.only(top: 24, left: 16),
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: data[index].dotColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.background, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: data[index].dotColor.withValues(alpha: 0.5),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  // Card
                  Expanded(
                    child: ExperienceCard(data: data[index]),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }

  List<ExperienceData> _getExperienceData() {
    return [
      ExperienceData(
        type: ExperienceType.work,
        role: 'Desenvolvedor Mobile',
        company: 'Colab',
        period: 'Jun 2023 – Atual',
        description: 'Atuação no desenvolvimento e manutenção contínua do aplicativo principal, utilizando arquitetura limpa com Flutter, MobX e modular. Foco em entrega de novas funcionalidades, resolução de bugs complexos e aprimoramento constante da stack técnica, incluindo Next.js.',
        tags: ['Flutter', 'Dart', 'Firebase', 'MobX', 'Modular', 'Hive'],
        dotColor: const Color(0xFF8B5CF6),
      ),
      ExperienceData(
        type: ExperienceType.work,
        role: 'Desenvolvedor Mobile',
        company: 'Autônomo',
        period: 'Fev 2023 – Jun 2023',
        description: 'Atuação como desenvolvedor independente na construção de aplicativos mobile do zero. Responsável por todo o ciclo de vida do projeto, utilizando Flutter e GetX para gerenciamento de estado e rotas, além de integração de bancos de dados locais.',
        tags: ['Flutter', 'Dart', 'Firebase', 'GetX', 'SQLite'],
        dotColor: const Color(0xFF3B82F6),
      ),
      ExperienceData(
        type: ExperienceType.education,
        role: 'Desenvolvimento Mobile',
        company: 'Academia do Flutter',
        period: 'Out 2022 – Out 2024',
        description: 'Especialização intensiva com foco no aprofundamento do ecossistema Flutter. Durante o curso, consolidei conhecimentos avançados em arquitetura de software, padrões de projeto, gerenciamento de estado complexo, e qualidade de entrega.',
        tags: ['Flutter Avançado', 'Arquitetura', 'Animações'],
        dotColor: const Color(0xFFEC4899),
      ),
      ExperienceData(
        type: ExperienceType.work,
        role: 'Desenvolvedor',
        company: 'Loja do Mecânico',
        period: 'Fev 2021 – Jan 2023',
        description: 'Início da trajetória como Desenvolvedor Web utilizando React e TypeScript. Posteriormente, realizei a transição interna para a equipe Mobile, onde atuei diretamente com Flutter na criação de interfaces responsivas em um e-commerce de alto tráfego.',
        tags: ['React', 'TypeScript', 'Flutter', 'Firebase'],
        dotColor: const Color(0xFFF59E0B),
      ),
      ExperienceData(
        type: ExperienceType.education,
        role: 'Desenvolvimento Mobile',
        company: 'B7WEB',
        period: 'Jul 2021 – Dez 2021',
        description: 'Capacitação técnica em desenvolvimento Fullstack. A formação proporcionou uma visão ponta a ponta do desenvolvimento de software, desde a construção de APIs até a implementação de interfaces modernas.',
        tags: ['Fullstack', 'Web', 'Mobile'],
        dotColor: const Color(0xFF10B981),
      ),
      ExperienceData(
        type: ExperienceType.education,
        role: 'Desenvolvimento Fullstack',
        company: 'Rocketseat',
        period: 'Jun 2020 – Jun 2021',
        description: 'Bootcamp intensivo voltado para o desenvolvimento de aplicações modernas com JavaScript. O programa acelerou minha curva de aprendizado para construir aplicações reais com React Native.',
        tags: ['React', 'Node.js', 'React Native'],
        dotColor: const Color(0xFF8B5CF6),
      ),
      ExperienceData(
        type: ExperienceType.work,
        role: 'Desenvolvedor Mobile',
        company: 'Incca Sistemas',
        period: 'Jun 2020 – Jan 2021',
        description: 'Primeira experiência profissional na área de tecnologia, iniciando como estagiário. Atuei no ciclo de desenvolvimento de um aplicativo mobile em React Native, desde a concepção no Figma até a codificação final.',
        tags: ['React Native', 'TypeScript', 'Figma'],
        dotColor: const Color(0xFF3B82F6),
      ),
      ExperienceData(
        type: ExperienceType.education,
        role: 'Análise e Desen. de Sistemas',
        company: 'Fatec Franca',
        period: 'Fev 2018 – Jun 2021',
        description: 'Formação superior tecnológica que me proporcionou a base teórica e prática essencial. O curso estruturou meu raciocínio lógico necessário para atuar profissionalmente na criação de sistemas e arquiteturas de software.',
        tags: ['Teoria', 'Engenharia de Software', 'Banco de Dados'],
        dotColor: const Color(0xFFEC4899),
      ),
    ];
  }
}

class ExperienceCard extends StatefulWidget {
  final ExperienceData data;

  const ExperienceCard({super.key, required this.data});

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          _isExpanded = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isWork = widget.data.type == ExperienceType.work;
    final badgeColor = isWork ? const Color(0xFF3B82F6) : const Color(0xFFEC4899);
    final badgeText = isWork ? 'Trabalho' : 'Educação';
    final badgeIcon = isWork ? Icons.work_outline : Icons.school_outlined;

    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
          boxShadow: [
            if (_isExpanded)
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row do badge e icone
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: badgeColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(badgeIcon, color: badgeColor, size: 16),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: badgeColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: badgeColor.withValues(alpha: 0.2)),
                      ),
                      child: Text(
                        badgeText,
                        style: TextStyle(
                          color: badgeColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                Icon(
                  _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: Colors.white.withValues(alpha: 0.5),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Titulo e Instituição
            Text(
              widget.data.role,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '${widget.data.company} • ${widget.data.period}',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.6),
                fontSize: 13,
              ),
            ),
            
            // Corpo (Expandable)
            AnimatedCrossFade(
              firstChild: const SizedBox(width: double.infinity, height: 0),
              secondChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    widget.data.description,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.data.tags.map((tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                        ),
                        child: Text(
                          tag,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.6),
                            fontSize: 12,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),
          ],
        ),
      ),
    );
  }
}
