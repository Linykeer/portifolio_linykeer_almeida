import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/app_colors.dart';

class Project {
  final int id;
  final String title;
  final String category;
  final List<String> tags;
  final String image;
  final List<String> gallery;
  final String description;
  final String longDescription;
  final List<String> features;
  final List<String> learnings;
  final String role;
  final String duration;
  final String year;
  final Color color;
  final String github;
  final String live;

  Project({
    required this.id,
    required this.title,
    required this.category,
    required this.tags,
    required this.image,
    required this.gallery,
    required this.description,
    required this.longDescription,
    required this.features,
    required this.learnings,
    required this.role,
    required this.duration,
    required this.year,
    required this.color,
    this.github = '',
    this.live = '',
  });
}

final List<Project> portfolioProjects = [
  Project(
    id: 1,
    title: 'Colab Social',
    category: 'Mobile',
    tags: ['Flutter', 'MobX', 'Modular', 'Clean Architecture', 'REST APIs', 'Hive', 'Git', 'Figma'],
    image: 'assets/colab_social/0.png',
    gallery: [
      'assets/colab_social/0.png',
      'assets/colab_social/1.png',
      'assets/colab_social/2.png',
      'assets/colab_social/3.png',
      'assets/colab_social/4.png',
      'assets/colab_social/5.png',
      'assets/colab_social/6.png',
    ],
    description: 'Aplicativo ponte entre cidadão e governo para agendamento de serviços, demandas e participação cidadã.',
    longDescription: 'Com o Colab Social você consegue agendar serviços públicos, reportar demandas, emitir documentos e participar ativamente das decisões da sua cidade! É uma plataforma que aproxima o cidadão do governo, tornando a gestão pública mais transparente, acessível e colaborativa.',
    features: [
      'Agendamento de serviços públicos',
      'Reporte e acompanhamento de demandas',
      'Emissão de documentos digitais',
      'Participação em decisões da cidade',
      'Notificações de status em tempo real',
      'Geolocalização de solicitações',
    ],
    learnings: [
      'Flutter + MobX para estado reativo complexo',
      'Modular e Clean Architecture em escala real',
      'Integração com REST APIs governamentais',
      'Persistência offline com Hive',
      'Fluxo de design com Figma até produção',
    ],
    role: 'Mobile Developer',
    duration: '2023 – Atual',
    year: '2023',
    color: const Color(0xFF6366F1),
  ),
  Project(
    id: 2,
    title: 'Colab Campo',
    category: 'Mobile',
    tags: ['Flutter', 'MobX', 'Modular', 'Clean Architecture', 'REST APIs', 'Hive', 'Git', 'Figma'],
    image: 'assets/colab_campo/0.png',
    gallery: [
      'assets/colab_campo/0.png',
      'assets/colab_campo/1.png',
      'assets/colab_campo/2.png',
      'assets/colab_campo/3.png',
      'assets/colab_campo/4.png',
      'assets/colab_campo/5.png',
      'assets/colab_campo/6.png',
      'assets/colab_campo/7.png',
    ],
    description: 'Ferramenta mobile para registro e manutenção de solicitações feitas pela entidade e pelo cidadão.',
    longDescription: 'O Colab Campo é um aplicativo utilizado como ferramenta para o registro e manutenção de solicitações feitas pela entidade e pelo cidadão. Voltado para equipes que atuam em campo, o app permite coletar, registrar e gerenciar informações de forma eficiente mesmo em locais com conectividade limitada.',
    features: [
      'Registro de solicitações em campo',
      'Funcionamento offline-first com Hive',
      'Sincronização automática ao recuperar sinal',
      'Formulários dinâmicos customizáveis',
      'Histórico e rastreio de solicitações',
      'Integração com mapas para geolocalização',
    ],
    learnings: [
      'Flutter + MobX + Modular em app corporativo',
      'Arquitetura Clean Architecture na prática',
      'Offline-first avançado com Hive',
      'Consumo de REST APIs com tratamento robusto de erros',
      'Versionamento e CI com Git',
    ],
    role: 'Mobile Developer',
    duration: '2023 – Atual',
    year: '2023',
    color: const Color(0xFF10B981),
  ),
  Project(
    id: 3,
    title: 'Epoh Agendamentos',
    category: 'Mobile',
    tags: ['Flutter', 'GetX', 'MVC', 'REST APIs', 'Firebase', 'Git', 'Figma', 'ADS'],
    image: 'assets/epoh/0.png',
    gallery: [
      'assets/epoh/0.png',
      'assets/epoh/1.png',
      'assets/epoh/2.png',
      'assets/epoh/3.png',
      'assets/epoh/4.png',
      'assets/epoh/5.png',
      'assets/epoh/6.png',
    ],
    description: 'Projeto de agendamento desenvolvido como estudo que chegou às lojas com Firebase e integração de ADS.',
    longDescription: 'O Epoh Agendamentos nasceu como um projeto de estudo de agendamentos e acabou evoluindo ao ponto de ser publicado nas lojas. O app gerencia calendários de prestadores de serviço, permite que clientes agendem horários e conta com integração de anúncios (ADS). Foi removido das lojas por falta de documentação e estrutura de ADS.',
    features: [
      'Agendamento de serviços com calendário interativo',
      'Autenticação e perfis via Firebase',
      'Notificações push para lembretes',
      'Painel do prestador de serviço',
      'Integração com ADS para monetização',
      'Publicado em App Store e Google Play',
    ],
    learnings: [
      'Flutter + GetX para navegação e estado',
      'Arquitetura MVC aplicada em app real',
      'Firebase Auth, Firestore e Cloud Messaging',
      'Fluxo completo de publicação nas lojas',
      'Integração e configuração de ADS mobile',
    ],
    role: 'Fullstack Mobile',
    duration: '8 meses',
    year: '2023',
    color: const Color(0xFF8B5CF6),
  ),
  Project(
    id: 4,
    title: 'ClinicApp',
    category: 'Mobile',
    tags: ['Flutter', 'MobX', 'MVC', 'REST APIs', 'Supabase', 'Git', 'Figma'],
    image: 'assets/clinicapp/logo.jpeg',
    gallery: [
      'assets/clinicapp/logo.jpeg',
    ],
    description: 'Plataforma mobile para gerenciamento completo de clínicas e consultórios.',
    longDescription: 'O ClinicApp é um projeto para gerenciamento de clínicas, desenvolvido para centralizar e simplificar a gestão de pacientes, consultas e profissionais de saúde. A plataforma oferece uma visão clara da agenda, controle de prontuários e comunicação eficiente entre clínica e paciente.',
    features: [
      'Gestão de pacientes e prontuários',
      'Agenda de consultas para profissionais',
      'Autenticação e controle de acesso por perfil',
      'Integração com backend via Supabase',
      'Dashboard com visão geral da clínica',
      'Interface responsiva e acessível',
    ],
    learnings: [
      'Flutter + MobX para gerenciamento de estado clínico',
      'Supabase como backend: Auth, Database e Storage',
      'Arquitetura MVC em domínio de saúde',
      'Design de interfaces complexas com Figma',
      'REST APIs e segurança de dados sensíveis',
    ],
    role: 'Mobile Developer',
    duration: '5 meses',
    year: '2025',
    color: const Color(0xFFEC4899),
  ),
  Project(
    id: 5,
    title: 'Agendeline',
    category: 'Mobile',
    tags: ['Flutter', 'MobX', 'Modular', 'Clean Architecture', 'Supabase', 'REST APIs', 'Git', 'Figma', 'Push Notification'],
    image: 'assets/agendeline/0.png',
    gallery: [
      'assets/agendeline/0.png',
      'assets/agendeline/1.png',
      'assets/agendeline/2.png',
      'assets/agendeline/3.png',
      'assets/agendeline/4.png',
    ],
    description: 'SaaS para gerenciamento de agendas e filas de espera para qualquer profissional que trabalhe com horários.',
    longDescription: 'O Agendeline é um SaaS designado para qualquer profissional que trabalhe com horários agendados ou filas de espera. A plataforma oferece gestão completa de agenda, controle de clientes, filas virtuais em tempo real e notificações push, tudo em um único lugar — publicado nas lojas para iOS e Android.',
    features: [
      'Gestão completa de agenda por profissional',
      'Fila de espera virtual em tempo real',
      'Notificações push para clientes e prestadores',
      'Painel SaaS multiusuário com perfis',
      'Publicado em App Store e Google Play',
      'Integração com Supabase para dados em tempo real',
    ],
    learnings: [
      'Flutter + MobX + Modular em produto SaaS real',
      'Clean Architecture para domínio complexo de agendas',
      'Supabase Realtime para filas ao vivo',
      'Push Notification: FCM e APNs',
      'Fluxo completo de publicação nas lojas',
      'Design e prototipação no Figma',
    ],
    role: 'Fullstack Mobile',
    duration: '2025 – Atual',
    year: '2025',
    color: const Color(0xFF3B82F6),
  ),
  Project(
    id: 6,
    title: 'Landing Page Agendeline',
    category: 'Web',
    tags: ['Flutter Web', 'Dart', 'Figma', 'UI/UX'],
    image: 'assets/landing-agendeline/0.png',
    gallery: [
      'assets/landing-agendeline/0.png',
      'assets/landing-agendeline/1.png',
      'assets/landing-agendeline/2.png',
      'assets/landing-agendeline/3.png',
      'assets/landing-agendeline/4.png',
      'assets/landing-agendeline/5.png',
      'assets/landing-agendeline/6.png',
    ],
    description: 'Landing page do aplicativo Agendeline, desenvolvida totalmente com Flutter Web.',
    longDescription: 'Página de conversão e apresentação do aplicativo Agendeline. O projeto foi desenvolvido com foco em performance e responsividade utilizando Flutter Web. O objetivo é demonstrar as funcionalidades do SaaS, planos de assinatura e facilitar o direcionamento dos usuários para as lojas de aplicativos.',
    features: [
      'Site institucional responsivo (Mobile, Tablet, Desktop)',
      'Animações dinâmicas e interativas com Flutter',
      'Redirecionamento dinâmico para App Store e Google Play',
      'Seção de planos e FAQ para conversão de leads',
    ],
    learnings: [
      'Domínio completo de layout responsivo avançado',
      'Otimizações de rendering para aplicações web',
      'Fidelidade visual extrema a partir do protótipo no Figma',
    ],
    role: 'Frontend Web Developer',
    duration: '2 semanas',
    year: '2025',
    color: const Color(0xFF06B6D4),
    live: 'https://www.agendeline.com.br',
  ),
];

class ProjectsWidget extends StatefulWidget {
  const ProjectsWidget({super.key});

  @override
  State<ProjectsWidget> createState() => _ProjectsWidgetState();
}

class _ProjectsWidgetState extends State<ProjectsWidget> {
  String selectedFilter = 'Todos';
  final filters = ['Todos', 'Web', 'Mobile', 'UI/UX'];

  void _openProjectDetail(Project project, int index, List<Project> filteredList) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Fechar',
      barrierColor: Colors.black87,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: _ProjectDetailDialog(
            initialProject: project,
            allProjects: filteredList,
            initialIndex: index,
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
          )),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1024;
    final paddingHorizontal = isMobile ? 16.0 : 120.0;

    final filteredProjects = selectedFilter == 'Todos'
        ? portfolioProjects
        : portfolioProjects.where((p) => p.category == selectedFilter).toList();

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'PORTFÓLIO',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2,
                        color: Color(0xFF6366F1),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Projetos em Destaque',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              if (!isMobile) _buildFilters(),
            ],
          ),

          if (isMobile)
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: _buildFilters(),
            ),

          const SizedBox(height: 40),

          LayoutBuilder(
            builder: (context, constraints) {
              final isSmall = constraints.maxWidth < 700;
              final isTablet = constraints.maxWidth < 1024;

              return Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.start,
                children: List.generate(filteredProjects.length, (index) {
                  double cardWidth;
                  if (isSmall) {
                    cardWidth = constraints.maxWidth;
                  } else if (isTablet) {
                    cardWidth = (constraints.maxWidth - 24) / 2;
                  } else {
                    cardWidth = (constraints.maxWidth - 48) / 3;
                  }

                  final project = filteredProjects[index];

                  return _ProjectCard(
                    project: project,
                    width: cardWidth,
                    onTap: () => _openProjectDetail(project, index, filteredProjects),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: filters.map((filter) {
        final isSelected = selectedFilter == filter;
        return Padding(
          padding: const EdgeInsets.only(left: 8),
          child: InkWell(
            onTap: () => setState(() => selectedFilter = filter),
            borderRadius: BorderRadius.circular(8),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.white.withValues(alpha: 0.08)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: isSelected
                    ? Border.all(color: Colors.white.withValues(alpha: 0.1))
                    : null,
              ),
              child: Text(
                filter,
                style: TextStyle(
                  color: isSelected ? Colors.white : const Color(0xFF64748B),
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Project project;
  final double width;
  final VoidCallback onTap;

  const _ProjectCard({
    required this.project,
    required this.width,
    required this.onTap,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: widget.width,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered
                  ? widget.project.color.withValues(alpha: 0.6)
                  : Colors.white.withValues(alpha: 0.06),
              width: _isHovered ? 1.5 : 1,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: widget.project.color.withValues(alpha: 0.15),
                      blurRadius: 24,
                      spreadRadius: 0,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: AnimatedScale(
                          scale: _isHovered ? 1.05 : 1.0,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeOutCubic,
                          child: Hero(
                            tag: 'project_img_${widget.project.id}',
                            child: Image.asset(
                              widget.project.image,
                              fit: BoxFit.cover,
                              cacheWidth: 600,
                              alignment: Alignment.topCenter,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: AppColors.surfaceLight,
                                  child: const Center(
                                    child: Icon(
                                      Icons.image_not_supported_outlined,
                                      size: 40,
                                      color: Colors.white24,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: _isHovered ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 250),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                widget.project.color.withValues(alpha: 0.2),
                              ],
                            ),
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: _isHovered ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 250),
                        child: Container(
                          color: Colors.black.withValues(alpha: 0.4),
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [widget.project.color, widget.project.color.withValues(alpha: 0.8)],
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.open_in_new, color: Colors.white, size: 16),
                                  SizedBox(width: 8),
                                  Text('Ver Projeto', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: widget.project.color.withValues(alpha: 0.2),
                            border: Border.all(color: widget.project.color.withValues(alpha: 0.4)),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            widget.project.category,
                            style: TextStyle(
                              color: widget.project.color,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.6),
                            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.photo_library, size: 10, color: Colors.white70),
                              const SizedBox(width: 4),
                              Text(
                                '${widget.project.gallery.length}',
                                style: const TextStyle(color: Colors.white70, fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.width < 700 ? null : 200,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.project.description,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF94A3B8),
                        height: 1.6,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: widget.project.tags.map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
                          ),
                          child: Text(
                            tag,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFFCBD5E1),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),);
  }
}

class _ProjectDetailDialog extends StatefulWidget {
  final Project initialProject;
  final List<Project> allProjects;
  final int initialIndex;

  const _ProjectDetailDialog({
    required this.initialProject,
    required this.allProjects,
    required this.initialIndex,
  });

  @override
  State<_ProjectDetailDialog> createState() => _ProjectDetailDialogState();
}

class _ProjectDetailDialogState extends State<_ProjectDetailDialog> {
  late Project currentProject;
  late int currentIndex;
  int activeImgIndex = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    currentProject = widget.initialProject;
    currentIndex = widget.initialIndex;
    
    HardwareKeyboard.instance.addHandler(_handleKeyEvent);
  }

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(_handleKeyEvent);
    _scrollController.dispose();
    super.dispose();
  }

  bool _handleKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.escape) {
        Navigator.of(context).pop();
        return true;
      } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        _nav(-1);
        return true;
      } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        _nav(1);
        return true;
      }
    }
    return false;
  }

  void _nav(int direction) {
    setState(() {
      currentIndex = (currentIndex + direction + widget.allProjects.length) % widget.allProjects.length;
      currentProject = widget.allProjects[currentIndex];
      activeImgIndex = 0;
      if (_scrollController.hasClients) {
        _scrollController.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            behavior: HitTestBehavior.opaque,
            child: Container(color: Colors.transparent),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width < 900 ? MediaQuery.of(context).size.width : 900,
          color: const Color(0xFF0E0E17),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.white.withValues(alpha: 0.06))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back, color: Colors.white54, size: 16),
                      label: const Text('Voltar', style: TextStyle(color: Colors.white54)),
                    ),
                    Row(
                      children: [
                        Text(
                          '${currentIndex + 1} / ${widget.allProjects.length}',
                          style: const TextStyle(color: Colors.white30, fontSize: 12),
                        ),
                        const SizedBox(width: 16),
                        _buildIconButton(Icons.chevron_left, () => _nav(-1)),
                        const SizedBox(width: 8),
                        _buildIconButton(Icons.chevron_right, () => _nav(1)),
                        const SizedBox(width: 16),
                        _buildIconButton(Icons.close, () => Navigator.of(context).pop(), isDestructive: true),
                      ],
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 400,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Hero(
                                tag: 'project_img_${currentProject.id}',
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: Image.asset(
                                    currentProject.gallery[activeImgIndex],
                                    key: ValueKey(currentProject.gallery[activeImgIndex]),
                                    fit: BoxFit.cover, 
                                    alignment: Alignment.topCenter,
                                    cacheHeight: 1000,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              height: 200,
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.transparent, Color(0xFF0E0E17)],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 16,
                              right: 16,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.black.withValues(alpha: 0.6),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.photo_library, size: 12, color: Colors.white70),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${activeImgIndex + 1}/${currentProject.gallery.length}',
                                      style: const TextStyle(color: Colors.white70, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (currentProject.gallery.length > 1) ...[
                              Positioned(
                                left: 16,
                                top: 250 - 20, 
                                child: _buildGalleryNavButton(Icons.chevron_left, () {
                                  setState(() {
                                    activeImgIndex = (activeImgIndex - 1 + currentProject.gallery.length) % currentProject.gallery.length;
                                  });
                                }),
                              ),
                              Positioned(
                                right: 16,
                                top: 250 - 20, 
                                child: _buildGalleryNavButton(Icons.chevron_right, () {
                                  setState(() {
                                    activeImgIndex = (activeImgIndex + 1) % currentProject.gallery.length;
                                  });
                                }),
                              ),
                              Positioned(
                                bottom: 20,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(currentProject.gallery.length, (i) {
                                    final isActive = i == activeImgIndex;
                                    return GestureDetector(
                                      onTap: () => setState(() => activeImgIndex = i),
                                      child: AnimatedContainer(
                                        duration: const Duration(milliseconds: 200),
                                        margin: const EdgeInsets.symmetric(horizontal: 4),
                                        width: isActive ? 60 : 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          border: isActive ? Border.all(color: currentProject.color, width: 2) : null,
                                          image: DecorationImage(
                                            image: AssetImage(currentProject.gallery[i]),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: isActive ? [BoxShadow(color: currentProject.color.withValues(alpha: 0.4), blurRadius: 10)] : null,
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ]
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Builder(
                              builder: (context) {
                                final isMobile = MediaQuery.of(context).size.width < 700;
                                final titleSection = Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      spacing: 12,
                                      runSpacing: 8,
                                      crossAxisAlignment: WrapCrossAlignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: currentProject.color.withValues(alpha: 0.2),
                                            border: Border.all(color: currentProject.color.withValues(alpha: 0.4)),
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Text(currentProject.category, style: TextStyle(color: currentProject.color, fontSize: 12)),
                                        ),
                                        Text('· ${currentProject.year}', style: const TextStyle(color: Colors.white30, fontSize: 12)),
                                        Text('· ${currentProject.duration}', style: const TextStyle(color: Colors.white30, fontSize: 12)),
                                        Text('· ${currentProject.role}', style: const TextStyle(color: Colors.white30, fontSize: 12)),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      currentProject.title,
                                      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                  ],
                                );

                                final actionButtons = currentProject.github.isNotEmpty || currentProject.live.isNotEmpty
                                    ? Wrap(
                                        spacing: 12,
                                        runSpacing: 12,
                                        children: [
                                          if (currentProject.github.isNotEmpty)
                                            OutlinedButton.icon(
                                              onPressed: () => launchUrl(Uri.parse(currentProject.github)),
                                              icon: const Icon(Icons.code, size: 16),
                                              label: const Text('GitHub'),
                                              style: OutlinedButton.styleFrom(
                                                foregroundColor: Colors.white60,
                                                side: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
                                              ),
                                            ),
                                          if (currentProject.live.isNotEmpty)
                                            ElevatedButton.icon(
                                              onPressed: () => launchUrl(Uri.parse(currentProject.live)),
                                              icon: const Icon(Icons.open_in_new, size: 16),
                                              label: const Text('Ver ao vivo'),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: currentProject.color,
                                                foregroundColor: Colors.white,
                                              ),
                                            ),
                                        ],
                                      )
                                    : const SizedBox.shrink();

                                if (isMobile) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      titleSection,
                                      if (currentProject.github.isNotEmpty || currentProject.live.isNotEmpty) ...[
                                        const SizedBox(height: 24),
                                        actionButtons,
                                      ],
                                    ],
                                  );
                                }

                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(child: titleSection),
                                    if (currentProject.github.isNotEmpty || currentProject.live.isNotEmpty) ...[
                                      const SizedBox(width: 24),
                                      actionButtons,
                                    ],
                                  ],
                                );
                              },
                            ),

                            const SizedBox(height: 24),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: currentProject.tags.map((t) => Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.04),
                                  border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(t, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                              )).toList(),
                            ),

                            const SizedBox(height: 32),
                            Container(height: 1, color: Colors.white.withValues(alpha: 0.06)),
                            const SizedBox(height: 32),

                            Row(
                              children: [
                                Container(width: 4, height: 24, decoration: BoxDecoration(color: currentProject.color, borderRadius: BorderRadius.circular(2))),
                                const SizedBox(width: 12),
                                const Text('Sobre o projeto', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              currentProject.longDescription,
                              style: const TextStyle(color: Colors.white54, fontSize: 15, height: 1.6),
                            ),

                            const SizedBox(height: 40),

                            Builder(
                              builder: (context) {
                                final isMobile = MediaQuery.of(context).size.width < 700;
                                final featuresContainer = Container(
                                  padding: const EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.02),
                                    border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.check_circle_outline, color: currentProject.color, size: 20),
                                          const SizedBox(width: 8),
                                          const Text('Funcionalidades', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      ...currentProject.features.map((f) => Padding(
                                        padding: const EdgeInsets.only(bottom: 12),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(margin: const EdgeInsets.only(top: 6), width: 6, height: 6, decoration: BoxDecoration(color: currentProject.color, shape: BoxShape.circle)),
                                            const SizedBox(width: 12),
                                            Expanded(child: Text(f, style: const TextStyle(color: Colors.white54, fontSize: 14))),
                                          ],
                                        ),
                                      )),
                                    ],
                                  ),
                                );

                                final learningsContainer = Container(
                                  padding: const EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.02),
                                    border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Row(
                                        children: [
                                          Icon(Icons.lightbulb_outline, color: Colors.amber, size: 20),
                                          SizedBox(width: 8),
                                          Text('O que aprendi', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      ...currentProject.learnings.asMap().entries.map((entry) => Padding(
                                        padding: const EdgeInsets.only(bottom: 12),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('${entry.key + 1}.'.padLeft(3, '0'), style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 14)),
                                            const SizedBox(width: 12),
                                            Expanded(child: Text(entry.value, style: const TextStyle(color: Colors.white54, fontSize: 14))),
                                          ],
                                        ),
                                      )),
                                    ],
                                  ),
                                );

                                if (isMobile) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      featuresContainer,
                                      const SizedBox(height: 24),
                                      learningsContainer,
                                    ],
                                  );
                                }

                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(child: featuresContainer),
                                    const SizedBox(width: 24),
                                    Expanded(child: learningsContainer),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onTap, {bool isDestructive = false}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 16,
          color: isDestructive ? Colors.red.withValues(alpha: 0.6) : Colors.white54,
        ),
      ),
    );
  }

  Widget _buildGalleryNavButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.5),
          border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.white70),
      ),
    );
  }
}
