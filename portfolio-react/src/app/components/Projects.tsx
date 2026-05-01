import { useState, useRef, useEffect } from "react";
import { motion, AnimatePresence, useInView } from "motion/react";
import {
  Github,
  ExternalLink,
  X,
  ChevronLeft,
  ChevronRight,
  CheckCircle2,
  Lightbulb,
  Calendar,
  ArrowLeft,
  ImageIcon,
} from "lucide-react";
import { ImageWithFallback } from "./figma/ImageWithFallback";

const categories = ["Todos", "Web", "Mobile", "UI/UX"];

export type Project = {
  id: number;
  title: string;
  category: string;
  tags: string[];
  image: string;
  gallery: string[];
  description: string;
  longDescription: string;
  features: string[];
  learnings: string[];
  role: string;
  duration: string;
  year: string;
  color: string;
  github: string;
  live: string;
};

const projects: Project[] = [
  {
    id: 1,
    title: "Dashboard E-commerce",
    category: "Web",
    tags: ["React", "TypeScript", "Tailwind", "Recharts"],
    image:
      "https://images.unsplash.com/photo-1763718528755-4bca23f82ac3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHx3ZWIlMjBkYXNoYm9hcmQlMjBlY29tbWVyY2UlMjBpbnRlcmZhY2V8ZW58MXx8fHwxNzc3NTU2NTcyfDA&ixlib=rb-4.1.0&q=80&w=1080",
    gallery: [
      "https://images.unsplash.com/photo-1763718528755-4bca23f82ac3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHx3ZWIlMjBkYXNoYm9hcmQlMjBlY29tbWVyY2UlMjBpbnRlcmZhY2V8ZW58MXx8fHwxNzc3NTU2NTcyfDA&ixlib=rb-4.1.0&q=80&w=1080",
      "https://images.unsplash.com/photo-1516031190212-da133013de50?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxlY29tbWVyY2UlMjBhbmFseXRpY3MlMjBjaGFydCUyMGRhcmslMjBkYXNoYm9hcmR8ZW58MXx8fHwxNzc3NTU2OTI1fDA&ixlib=rb-4.1.0&q=80&w=1080",
      "https://images.unsplash.com/photo-1584472666879-7d92db132958?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxwcm9kdWN0JTIwbWFuYWdlbWVudCUyMHRhYmxlJTIwaW50ZXJmYWNlfGVufDF8fHx8MTc3NzU1NjkyNXww&ixlib=rb-4.1.0&q=80&w=1080",
    ],
    description:
      "Dashboard completo para gerenciamento de e-commerce com gráficos em tempo real, gestão de produtos e análise de vendas.",
    longDescription:
      "Um painel administrativo robusto e responsivo desenvolvido para uma loja virtual. O sistema centraliza todas as informações essenciais do negócio: vendas em tempo real, controle de estoque, gerenciamento de pedidos e análise de desempenho por período. A interface foi pensada para ser intuitiva tanto em desktop quanto em dispositivos móveis.",
    features: [
      "Gráficos interativos de vendas com Recharts",
      "Tabela de produtos com filtro, paginação e busca",
      "Sistema de notificações em tempo real",
      "Tema claro/escuro com persistência",
      "Exportação de relatórios em PDF/CSV",
      "Dashboard responsivo (mobile-first)",
    ],
    learnings: [
      "Otimização de re-renders com React.memo e useMemo",
      "Gerenciamento de estado complexo com Zustand",
      "Integração com REST APIs e tratamento de erros",
    ],
    role: "Frontend Developer",
    duration: "6 semanas",
    year: "2024",
    color: "#a78bfa",
    github: "https://github.com",
    live: "https://linykeer.com.br",
  },
  {
    id: 2,
    title: "App de Saúde",
    category: "Mobile",
    tags: ["React Native", "Expo", "TypeScript"],
    image:
      "https://images.unsplash.com/photo-1767449181027-dbca7575f91b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtb2JpbGUlMjBhcHAlMjBVSSUyMGRlc2lnbiUyMHByb2plY3R8ZW58MXx8fHwxNzc3NTQzNjU1fDA&ixlib=rb-4.1.0&q=80&w=1080",
    gallery: [
      "https://images.unsplash.com/photo-1767449181027-dbca7575f91b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtb2JpbGUlMjBhcHAlMjBVSSUyMGRlc2lnbiUyMHByb2plY3R8ZW58MXx8fHwxNzc3NTQzNjU1fDA&ixlib=rb-4.1.0&q=80&w=1080",
      "https://images.unsplash.com/photo-1612197315273-4ced0a731bba?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxmaXRuZXNzJTIwaGVhbHRoJTIwbW9iaWxlJTIwc2NyZWVuJTIwcGhvbmV8ZW58MXx8fHwxNzc3NTU2OTI4fDA&ixlib=rb-4.1.0&q=80&w=1080",
      "https://images.unsplash.com/photo-1776521796613-564c9f7d02e7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxyZWFjdCUyMHR5cGVzY3JpcHQlMjBjb2RlJTIwcHJvZ3JhbW1pbmd8ZW58MXx8fHwxNzc3NTU2NTc1fDA&ixlib=rb-4.1.0&q=80&w=1080",
    ],
    description:
      "Aplicativo mobile para acompanhamento de saúde, com monitoramento de atividades, hidratação e sono.",
    longDescription:
      "Aplicativo desenvolvido com React Native e Expo focado no bem-estar do usuário. Permite registrar atividades físicas, controlar a ingestão de água diária e monitorar a qualidade do sono. Gera relatórios semanais com insights personalizados e envia lembretes inteligentes baseados nos hábitos do usuário.",
    features: [
      "Registro de exercícios com timer integrado",
      "Controle de hidratação com lembretes",
      "Monitoramento de sono e qualidade",
      "Relatórios semanais e mensais",
      "Notificações push personalizadas",
      "Sincronização com Apple Health / Google Fit",
    ],
    learnings: [
      "Desenvolvimento mobile cross-platform com Expo",
      "Animações nativas com Reanimated",
      "Armazenamento local com AsyncStorage e SQLite",
    ],
    role: "Mobile Developer",
    duration: "8 semanas",
    year: "2024",
    color: "#60a5fa",
    github: "https://github.com",
    live: "https://linykeer.com.br",
  },
  {
    id: 3,
    title: "Landing Page Moderna",
    category: "Web",
    tags: ["Next.js", "Tailwind", "Framer Motion"],
    image:
      "https://images.unsplash.com/photo-1760008486593-a85315610136?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxsYW5kaW5nJTIwcGFnZSUyMHdlYnNpdGUlMjBkZXNpZ24lMjBtb2Rlcm58ZW58MXx8fHwxNzc3NTU2NTcyfDA&ixlib=rb-4.1.0&q=80&w=1080",
    gallery: [
      "https://images.unsplash.com/photo-1760008486593-a85315610136?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxsYW5kaW5nJTIwcGFnZSUyMHdlYnNpdGUlMjBkZXNpZ24lMjBtb2Rlcm58ZW58MXx8fHwxNzc3NTU2NTcyfDA&ixlib=rb-4.1.0&q=80&w=1080",
      "https://images.unsplash.com/photo-1634084462412-b54873c0a56d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtb2Rlcm4lMjB3ZWJzaXRlJTIwaG9tZXBhZ2UlMjBkZXNpZ24lMjBjbGVhbnxlbnwxfHx8fDE3Nzc1NTY5MzB8MA&ixlib=rb-4.1.0&q=80&w=1080",
      "https://images.unsplash.com/photo-1584472666879-7d92db132958?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxwcm9kdWN0JTIwbWFuYWdlbWVudCUyMHRhYmxlJTIwaW50ZXJmYWNlfGVufDF8fHx8MTc3NzU1NjkyNXww&ixlib=rb-4.1.0&q=80&w=1080",
    ],
    description:
      "Landing page com animações fluidas e design moderno para uma startup de tecnologia, foco em conversão.",
    longDescription:
      "Landing page de alta conversão criada para uma startup de SaaS. O projeto foi desenvolvido com foco em performance (Lighthouse 98+), animações suaves com Framer Motion e SEO otimizado com Next.js. A taxa de conversão aumentou 43% em comparação com a versão anterior do cliente.",
    features: [
      "Animações de scroll com Framer Motion",
      "Score 98+ no Lighthouse",
      "SEO otimizado com metadata dinâmica",
      "A/B testing com variantes de CTA",
      "Formulário de captura de leads integrado",
      "Integração com Google Analytics 4",
    ],
    learnings: [
      "Técnicas avançadas de animação com scroll",
      "Otimização de Core Web Vitals",
      "Estratégias de conversão e UX writing",
    ],
    role: "Frontend Developer",
    duration: "3 semanas",
    year: "2025",
    color: "#34d399",
    github: "https://github.com",
    live: "https://linykeer.com.br",
  },
  {
    id: 4,
    title: "Sistema de Código",
    category: "Web",
    tags: ["React", "Node.js", "TypeScript", "API REST"],
    image:
      "https://images.unsplash.com/photo-1776521796613-564c9f7d02e7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxyZWFjdCUyMHR5cGVzY3JpcHQlMjBjb2RlJTIwcHJvZ3JhbW1pbmd8ZW58MXx8fHwxNzc3NTU2NTc1fDA&ixlib=rb-4.1.0&q=80&w=1080",
    gallery: [
      "https://images.unsplash.com/photo-1776521796613-564c9f7d02e7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxyZWFjdCUyMHR5cGVzY3JpcHQlMjBjb2RlJTIwcHJvZ3JhbW1pbmd8ZW58MXx8fHwxNzc3NTU2NTc1fDA&ixlib=rb-4.1.0&q=80&w=1080",
      "https://images.unsplash.com/photo-1763718528755-4bca23f82ac3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHx3ZWIlMjBkYXNoYm9hcmQlMjBlY29tbWVyY2UlMjBpbnRlcmZhY2V8ZW58MXx8fHwxNzc3NTU2NTcyfDA&ixlib=rb-4.1.0&q=80&w=1080",
    ],
    description:
      "Plataforma de colaboração de código em tempo real com editor integrado e revisão de pull requests.",
    longDescription:
      "Plataforma fullstack para times de desenvolvimento. Combina um editor de código integrado no browser com sistema de revisão de PRs, comentários inline, pipeline de CI/CD visual e integração com GitHub. Desenvolvida para substituir o fluxo manual de revisão de código em pequenas equipes.",
    features: [
      "Editor Monaco integrado com syntax highlight",
      "Revisão de código com comentários inline",
      "Visualização de diff lado a lado",
      "Pipeline CI/CD com status em tempo real",
      "Sistema de notificações por e-mail e Slack",
      "Dashboard de métricas por desenvolvedor",
    ],
    learnings: [
      "Integração com a API do GitHub (OAuth e Webhooks)",
      "WebSockets para atualizações em tempo real",
      "Deploy e infraestrutura com Docker e Vercel",
    ],
    role: "Fullstack Developer",
    duration: "10 semanas",
    year: "2025",
    color: "#f472b6",
    github: "https://github.com",
    live: "https://linykeer.com.br",
  },
  {
    id: 5,
    title: "Workspace Design System",
    category: "UI/UX",
    tags: ["Figma", "Design System", "Protótipo"],
    image:
      "https://images.unsplash.com/photo-1744555270794-6d378b9e7cd3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxkZXZlbG9wZXIlMjB3b3Jrc3BhY2UlMjBkdWFsJTIwbW9uaXRvciUyMGRhcmt8ZW58MXx8fHwxNzc3NTU2NTY5fDA&ixlib=rb-4.1.0&q=80&w=1080",
    gallery: [
      "https://images.unsplash.com/photo-1744555270794-6d378b9e7cd3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxkZXZlbG9wZXIlMjB3b3Jrc3BhY2UlMjBkdWFsJTIwbW9uaXRvciUyMGRhcmt8ZW58MXx8fHwxNzc3NTU2NTY5fDA&ixlib=rb-4.1.0&q=80&w=1080",
      "https://images.unsplash.com/photo-1634084462412-b54873c0a56d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtb2Rlcm4lMjB3ZWJzaXRlJTIwaG9tZXBhZ2UlMjBkZXNpZ24lMjBjbGVhbnxlbnwxfHx8fDE3Nzc1NTY5MzB8MA&ixlib=rb-4.1.0&q=80&w=1080",
    ],
    description:
      "Design system completo com componentes reutilizáveis, guia de estilos e protótipos interativos no Figma.",
    longDescription:
      "Design system criado do zero para padronizar a identidade visual de um produto SaaS. Inclui biblioteca de componentes atômicos no Figma, tokens de design (cores, tipografia, espaçamento), guia de acessibilidade e protótipos interativos para todas as principais jornadas do usuário.",
    features: [
      "80+ componentes atômicos no Figma",
      "Tokens de design exportáveis para código",
      "Guia de acessibilidade (WCAG 2.1 AA)",
      "Protótipos de fluxos principais",
      "Dark mode e variações de tema",
      "Documentação completa de uso",
    ],
    learnings: [
      "Metodologia Atomic Design na prática",
      "Auto Layout avançado e variáveis no Figma",
      "Princípios de acessibilidade e design inclusivo",
    ],
    role: "UI/UX Designer",
    duration: "4 semanas",
    year: "2024",
    color: "#fbbf24",
    github: "https://github.com",
    live: "https://linykeer.com.br",
  },
];

/* ─── Project Detail Full-Screen ─────────────────────────── */
function ProjectDetail({
  project,
  onClose,
  onPrev,
  onNext,
  total,
  currentIndex,
}: {
  project: Project;
  onClose: () => void;
  onPrev: () => void;
  onNext: () => void;
  total: number;
  currentIndex: number;
}) {
  const [activeImg, setActiveImg] = useState(0);

  // Reset gallery on project change
  useEffect(() => setActiveImg(0), [project.id]);

  // Close on Escape
  useEffect(() => {
    const handler = (e: KeyboardEvent) => {
      if (e.key === "Escape") onClose();
      if (e.key === "ArrowLeft") onPrev();
      if (e.key === "ArrowRight") onNext();
    };
    window.addEventListener("keydown", handler);
    return () => window.removeEventListener("keydown", handler);
  }, [onClose, onPrev, onNext]);

  // Lock body scroll
  useEffect(() => {
    document.body.style.overflow = "hidden";
    return () => { document.body.style.overflow = ""; };
  }, []);

  return (
    <motion.div
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      exit={{ opacity: 0 }}
      transition={{ duration: 0.25 }}
      className="fixed inset-0 z-[200] flex"
      style={{ background: "rgba(0,0,0,0.7)", backdropFilter: "blur(10px)" }}
    >
      {/* Panel slides in from right */}
      <motion.div
        initial={{ x: "100%" }}
        animate={{ x: 0 }}
        exit={{ x: "100%" }}
        transition={{ type: "spring", stiffness: 300, damping: 35 }}
        className="ml-auto w-full max-w-4xl h-full bg-[#0e0e17] border-l border-white/8 flex flex-col overflow-hidden"
      >
        {/* ── Top bar ── */}
        <div className="flex items-center justify-between px-6 py-4 border-b border-white/6 flex-shrink-0">
          <button
            onClick={onClose}
            className="flex items-center gap-2 text-white/50 hover:text-white transition-colors text-sm"
          >
            <ArrowLeft size={16} /> Voltar aos projetos
          </button>

          <div className="flex items-center gap-3">
            {/* Project counter */}
            <span className="text-white/30 text-xs">
              {currentIndex + 1} / {total}
            </span>
            <div className="flex gap-1">
              <button
                onClick={onPrev}
                className="w-8 h-8 rounded-lg border border-white/10 flex items-center justify-center text-white/40 hover:text-white hover:border-white/25 transition-all"
              >
                <ChevronLeft size={15} />
              </button>
              <button
                onClick={onNext}
                className="w-8 h-8 rounded-lg border border-white/10 flex items-center justify-center text-white/40 hover:text-white hover:border-white/25 transition-all"
              >
                <ChevronRight size={15} />
              </button>
            </div>
            <button
              onClick={onClose}
              className="w-8 h-8 rounded-lg border border-white/10 flex items-center justify-center text-white/40 hover:text-white hover:border-red-500/50 hover:bg-red-500/10 transition-all"
            >
              <X size={15} />
            </button>
          </div>
        </div>

        {/* ── Scrollable content ── */}
        <div className="flex-1 overflow-y-auto">
          {/* Hero image with gallery */}
          <div className="relative">
            <AnimatePresence mode="wait">
              <motion.div
                key={activeImg}
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                exit={{ opacity: 0 }}
                transition={{ duration: 0.3 }}
                className="relative aspect-video w-full overflow-hidden"
              >
                <ImageWithFallback
                  src={project.gallery[activeImg]}
                  alt={`${project.title} - screenshot ${activeImg + 1}`}
                  className="w-full h-full object-cover"
                />
                {/* Bottom gradient */}
                <div
                  className="absolute inset-0"
                  style={{
                    background:
                      "linear-gradient(to bottom, transparent 50%, #0e0e17 100%)",
                  }}
                />
                {/* Accent color glow */}
                <div
                  className="absolute inset-0 opacity-20"
                  style={{
                    background: `radial-gradient(ellipse at center bottom, ${project.color}60, transparent 60%)`,
                  }}
                />

                {/* Gallery navigation arrows on image */}
                {project.gallery.length > 1 && (
                  <>
                    <button
                      onClick={() =>
                        setActiveImg(
                          (activeImg - 1 + project.gallery.length) %
                            project.gallery.length
                        )
                      }
                      className="absolute left-3 top-1/2 -translate-y-1/2 w-9 h-9 rounded-xl bg-black/50 border border-white/15 flex items-center justify-center text-white/70 hover:text-white hover:bg-black/70 transition-all"
                    >
                      <ChevronLeft size={17} />
                    </button>
                    <button
                      onClick={() =>
                        setActiveImg((activeImg + 1) % project.gallery.length)
                      }
                      className="absolute right-3 top-1/2 -translate-y-1/2 w-9 h-9 rounded-xl bg-black/50 border border-white/15 flex items-center justify-center text-white/70 hover:text-white hover:bg-black/70 transition-all"
                    >
                      <ChevronRight size={17} />
                    </button>
                  </>
                )}
              </motion.div>
            </AnimatePresence>

            {/* Thumbnail strip */}
            {project.gallery.length > 1 && (
              <div className="absolute bottom-4 left-1/2 -translate-x-1/2 flex gap-2 z-10">
                {project.gallery.map((img, i) => (
                  <button
                    key={i}
                    onClick={() => setActiveImg(i)}
                    className={`relative rounded-lg overflow-hidden transition-all duration-300 ${
                      i === activeImg
                        ? "ring-2 opacity-100 scale-105"
                        : "opacity-50 hover:opacity-75"
                    }`}
                    style={
                      i === activeImg
                        ? { ringColor: project.color, outlineColor: project.color, outline: `2px solid ${project.color}` }
                        : {}
                    }
                  >
                    <ImageWithFallback
                      src={img}
                      alt={`thumb ${i + 1}`}
                      className="w-16 h-10 object-cover"
                    />
                  </button>
                ))}
              </div>
            )}

            {/* Image count badge */}
            <div className="absolute top-3 right-3 flex items-center gap-1.5 px-2 py-1 rounded-lg bg-black/60 border border-white/10 text-white/60 text-xs">
              <ImageIcon size={11} />
              {activeImg + 1}/{project.gallery.length}
            </div>
          </div>

          {/* ── Content ── */}
          <div className="px-6 pb-10">
            {/* Title + actions */}
            <div className="flex items-start justify-between gap-4 mt-6 mb-6">
              <div>
                <div className="flex items-center gap-2 mb-2 flex-wrap">
                  <span
                    className="px-2.5 py-0.5 rounded-lg text-xs font-medium"
                    style={{
                      background: `${project.color}20`,
                      color: project.color,
                      border: `1px solid ${project.color}35`,
                    }}
                  >
                    {project.category}
                  </span>
                  <span className="text-white/25 text-xs flex items-center gap-1">
                    <Calendar size={11} /> {project.year}
                  </span>
                  <span className="text-white/25 text-xs">· {project.duration}</span>
                  <span className="text-white/25 text-xs">· {project.role}</span>
                </div>
                <h2
                  className="text-white"
                  style={{ fontSize: "clamp(1.5rem, 3vw, 2rem)", fontWeight: 700, lineHeight: 1.2 }}
                >
                  {project.title}
                </h2>
              </div>

              <div className="flex gap-2 flex-shrink-0 mt-1">
                <a
                  href={project.github}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="flex items-center gap-2 px-4 py-2 rounded-xl border border-white/10 text-white/60 hover:text-white hover:border-white/25 hover:bg-white/5 transition-all text-sm"
                >
                  <Github size={15} />
                  <span className="hidden sm:inline">GitHub</span>
                </a>
                <a
                  href={project.live}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="flex items-center gap-2 px-4 py-2 rounded-xl text-white text-sm transition-all hover:opacity-90 hover:scale-105"
                  style={{
                    background: `linear-gradient(135deg, ${project.color}, ${project.color}80)`,
                    boxShadow: `0 4px 20px ${project.color}30`,
                  }}
                >
                  <ExternalLink size={15} />
                  <span className="hidden sm:inline">Ver ao vivo</span>
                </a>
              </div>
            </div>

            {/* Tech tags */}
            <div className="flex flex-wrap gap-2 mb-8">
              {project.tags.map((tag) => (
                <span
                  key={tag}
                  className="px-3 py-1.5 rounded-xl text-sm text-white/65 border border-white/10 bg-white/[0.04] hover:border-white/20 hover:text-white/80 transition-all cursor-default"
                >
                  {tag}
                </span>
              ))}
            </div>

            {/* Divider */}
            <div className="h-px bg-white/6 mb-8" />

            {/* Description */}
            <div className="mb-8">
              <h3 className="text-white/90 font-semibold mb-3 flex items-center gap-2">
                <span
                  className="w-1 h-5 rounded-full inline-block"
                  style={{ background: `linear-gradient(to bottom, ${project.color}, transparent)` }}
                />
                Sobre o projeto
              </h3>
              <p className="text-white/55 leading-relaxed">{project.longDescription}</p>
            </div>

            {/* Two-column: Features + Learnings */}
            <div className="grid sm:grid-cols-2 gap-6 mb-8">
              {/* Features */}
              <div className="rounded-2xl border border-white/8 bg-white/[0.02] p-5">
                <h4 className="text-white/80 font-semibold mb-4 flex items-center gap-2 text-sm">
                  <CheckCircle2 size={16} style={{ color: project.color }} />
                  Funcionalidades
                </h4>
                <ul className="space-y-2.5">
                  {project.features.map((f) => (
                    <li key={f} className="flex items-start gap-2.5 text-sm text-white/50">
                      <span
                        className="mt-1.5 w-1.5 h-1.5 rounded-full flex-shrink-0"
                        style={{ background: project.color }}
                      />
                      {f}
                    </li>
                  ))}
                </ul>
              </div>

              {/* Learnings */}
              <div className="rounded-2xl border border-white/8 bg-white/[0.02] p-5">
                <h4 className="text-white/80 font-semibold mb-4 flex items-center gap-2 text-sm">
                  <Lightbulb size={16} style={{ color: "#fbbf24" }} />
                  O que aprendi
                </h4>
                <ul className="space-y-3">
                  {project.learnings.map((l, i) => (
                    <li key={i} className="flex items-start gap-2.5 text-sm text-white/50">
                      <span className="mt-0.5 text-yellow-400/70 font-bold flex-shrink-0">
                        {String(i + 1).padStart(2, "0")}
                      </span>
                      {l}
                    </li>
                  ))}
                </ul>
              </div>
            </div>

            {/* Bottom nav: other projects */}
            <div className="flex gap-3 pt-2">
              <button
                onClick={onPrev}
                className="flex-1 flex items-center justify-center gap-2 py-3 rounded-xl border border-white/8 text-white/40 hover:text-white hover:border-white/20 hover:bg-white/[0.03] transition-all text-sm"
              >
                <ChevronLeft size={16} /> Projeto anterior
              </button>
              <button
                onClick={onNext}
                className="flex-1 flex items-center justify-center gap-2 py-3 rounded-xl border border-white/8 text-white/40 hover:text-white hover:border-white/20 hover:bg-white/[0.03] transition-all text-sm"
              >
                Próximo projeto <ChevronRight size={16} />
              </button>
            </div>
          </div>
        </div>
      </motion.div>

      {/* Click outside to close */}
      <div className="absolute inset-0 -z-10" onClick={onClose} />
    </motion.div>
  );
}

/* ─── Project Card ────────────────────────────────────────── */
function ProjectCard({
  project,
  index,
  onOpen,
}: {
  project: Project;
  index: number;
  onOpen: (p: Project) => void;
}) {
  const ref = useRef(null);
  const inView = useInView(ref, { once: true, margin: "-60px" });
  const [hovered, setHovered] = useState(false);

  return (
    <motion.div
      ref={ref}
      initial={{ opacity: 0, y: 40 }}
      animate={inView ? { opacity: 1, y: 0 } : {}}
      transition={{ duration: 0.55, delay: index * 0.08 }}
      className="group relative rounded-2xl overflow-hidden cursor-pointer border border-white/8 bg-[#111118]"
      style={{
        boxShadow: hovered ? `0 20px 60px ${project.color}20` : "none",
        transition: "box-shadow 0.4s",
      }}
      onMouseEnter={() => setHovered(true)}
      onMouseLeave={() => setHovered(false)}
      onClick={() => onOpen(project)}
    >
      {/* Image */}
      <div className="relative overflow-hidden aspect-[16/10]">
        <ImageWithFallback
          src={project.image}
          alt={project.title}
          className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110"
        />
        <motion.div
          initial={false}
          animate={{ opacity: hovered ? 1 : 0 }}
          transition={{ duration: 0.3 }}
          className="absolute inset-0 flex items-center justify-center gap-4"
          style={{ background: "rgba(10,10,15,0.75)", backdropFilter: "blur(4px)" }}
        >
          <button
            onClick={(e) => { e.stopPropagation(); onOpen(project); }}
            className="flex items-center gap-2 px-5 py-2.5 rounded-xl text-white text-sm font-medium hover:opacity-90 transition-all"
            style={{ background: `linear-gradient(135deg, ${project.color}, ${project.color}99)` }}
          >
            <ExternalLink size={15} /> Ver Projeto
          </button>
          <a
            href={project.github}
            target="_blank"
            rel="noopener noreferrer"
            onClick={(e) => e.stopPropagation()}
            className="flex items-center gap-2 px-4 py-2.5 rounded-xl bg-white/10 border border-white/20 text-white text-sm hover:bg-white/20 transition-all"
          >
            <Github size={15} /> GitHub
          </a>
        </motion.div>

        <div
          className="absolute top-3 left-3 px-2 py-1 rounded-lg text-xs font-medium"
          style={{
            background: `${project.color}25`,
            color: project.color,
            border: `1px solid ${project.color}40`,
          }}
        >
          {project.category}
        </div>

        {/* Gallery count badge */}
        <div className="absolute top-3 right-3 flex items-center gap-1 px-2 py-1 rounded-lg bg-black/50 border border-white/10 text-white/50 text-xs">
          <ImageIcon size={10} /> {project.gallery.length}
        </div>
      </div>

      <div className="p-5">
        <h3 className="text-white font-semibold mb-1.5">{project.title}</h3>
        <p className="text-white/50 text-sm mb-4 line-clamp-2 leading-relaxed">
          {project.description}
        </p>
        <div className="flex flex-wrap gap-2">
          {project.tags.map((tag) => (
            <span
              key={tag}
              className="px-2 py-0.5 rounded-md text-xs text-white/50 border border-white/8 bg-white/[0.03]"
            >
              {tag}
            </span>
          ))}
        </div>
      </div>

      <motion.div
        initial={false}
        animate={{ scaleY: hovered ? 1 : 0 }}
        style={{
          position: "absolute",
          left: 0,
          top: 0,
          bottom: 0,
          width: 3,
          background: `linear-gradient(to bottom, ${project.color}, transparent)`,
          transformOrigin: "top",
        }}
      />
    </motion.div>
  );
}

/* ─── Section ─────────────────────────────────────────────── */
export function Projects() {
  const [filter, setFilter] = useState("Todos");
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const sectionRef = useRef(null);
  const inView = useInView(sectionRef, { once: true, margin: "-80px" });

  const filtered =
    filter === "Todos" ? projects : projects.filter((p) => p.category === filter);
  const selectedProject = projects.find((p) => p.id === selectedId) ?? null;
  const currentIndex = filtered.findIndex((p) => p.id === selectedId);

  const nav = (dir: 1 | -1) => {
    if (!selectedProject) return;
    const idx = filtered.findIndex((p) => p.id === selectedProject.id);
    const next = filtered[(idx + dir + filtered.length) % filtered.length];
    setSelectedId(next.id);
  };

  return (
    <section
      id="projetos"
      ref={sectionRef}
      className="py-28 bg-[#0c0c14] relative overflow-hidden"
    >
      <div
        className="absolute top-0 left-1/3 w-[600px] h-[300px] opacity-10 blur-3xl pointer-events-none"
        style={{ background: "radial-gradient(circle, #7c3aed, transparent 70%)" }}
      />

      <div className="max-w-6xl mx-auto px-6">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={inView ? { opacity: 1, y: 0 } : {}}
          transition={{ duration: 0.6 }}
          className="flex flex-col md:flex-row md:items-end justify-between gap-6 mb-12"
        >
          <div>
            <span className="text-[#a78bfa] text-sm tracking-widest uppercase font-medium">
              portfólio
            </span>
            <h2
              className="text-white mt-2"
              style={{ fontSize: "clamp(1.8rem, 3vw, 2.5rem)", fontWeight: 700 }}
            >
              Projetos em Destaque
            </h2>
          </div>

          <div className="flex gap-2 flex-wrap">
            {categories.map((cat) => (
              <button
                key={cat}
                onClick={() => setFilter(cat)}
                className={`relative px-4 py-2 rounded-xl text-sm transition-all duration-300 ${
                  filter === cat ? "text-white" : "text-white/40 hover:text-white/70"
                }`}
              >
                {filter === cat && (
                  <motion.span
                    layoutId="filter-pill"
                    className="absolute inset-0 rounded-xl"
                    style={{
                      background: "linear-gradient(135deg, #7c3aed40, #3b82f640)",
                      border: "1px solid #7c3aed50",
                    }}
                  />
                )}
                <span className="relative">{cat}</span>
              </button>
            ))}
          </div>
        </motion.div>

        <motion.div layout className="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
          <AnimatePresence mode="popLayout">
            {filtered.map((project, i) => (
              <motion.div
                key={project.id}
                layout
                initial={{ opacity: 0, scale: 0.95 }}
                animate={{ opacity: 1, scale: 1 }}
                exit={{ opacity: 0, scale: 0.95 }}
                transition={{ duration: 0.3 }}
              >
                <ProjectCard
                  project={project}
                  index={i}
                  onOpen={(p) => setSelectedId(p.id)}
                />
              </motion.div>
            ))}
          </AnimatePresence>
        </motion.div>
      </div>

      <AnimatePresence>
        {selectedProject && (
          <ProjectDetail
            project={selectedProject}
            onClose={() => setSelectedId(null)}
            onPrev={() => nav(-1)}
            onNext={() => nav(1)}
            total={filtered.length}
            currentIndex={currentIndex >= 0 ? currentIndex : 0}
          />
        )}
      </AnimatePresence>
    </section>
  );
}
