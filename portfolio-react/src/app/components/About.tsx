import { motion } from "motion/react";
import { useInView } from "motion/react";
import { useRef } from "react";
import { Code2, Palette, Zap, Heart } from "lucide-react";
import { ImageWithFallback } from "./figma/ImageWithFallback";

const highlights = [
  {
    icon: Code2,
    title: "Código Limpo",
    desc: "Escrevo código legível, organizado e escalável seguindo boas práticas.",
    color: "#a78bfa",
  },
  {
    icon: Palette,
    title: "Design Atento",
    desc: "Olho apurado para detalhes visuais, tipografia e hierarquia visual.",
    color: "#60a5fa",
  },
  {
    icon: Zap,
    title: "Performance",
    desc: "Interfaces rápidas e otimizadas com foco na experiência do usuário.",
    color: "#34d399",
  },
  {
    icon: Heart,
    title: "Paixão",
    desc: "Amo o que faço e coloco dedicação total em cada projeto.",
    color: "#f472b6",
  },
];

function Card({ item, index }: { item: typeof highlights[0]; index: number }) {
  const ref = useRef(null);
  const inView = useInView(ref, { once: true, margin: "-80px" });
  const Icon = item.icon;

  return (
    <motion.div
      ref={ref}
      initial={{ opacity: 0, y: 30 }}
      animate={inView ? { opacity: 1, y: 0 } : {}}
      transition={{ duration: 0.5, delay: index * 0.1 }}
      className="group relative p-5 rounded-2xl border border-white/8 bg-white/[0.03] hover:bg-white/[0.06] hover:border-white/15 transition-all duration-300"
    >
      <div
        className="w-10 h-10 rounded-xl flex items-center justify-center mb-4"
        style={{ background: `${item.color}20`, border: `1px solid ${item.color}30` }}
      >
        <Icon size={20} style={{ color: item.color }} />
      </div>
      <h4 className="text-white font-medium mb-1">{item.title}</h4>
      <p className="text-white/50 text-sm leading-relaxed">{item.desc}</p>
    </motion.div>
  );
}

export function About() {
  const sectionRef = useRef(null);
  const inView = useInView(sectionRef, { once: true, margin: "-100px" });

  return (
    <section
      id="sobre"
      ref={sectionRef}
      className="py-28 bg-[#0a0a0f] relative overflow-hidden"
    >
      {/* Subtle background accent */}
      <div
        className="absolute top-0 right-0 w-[500px] h-[500px] rounded-full opacity-10 blur-3xl pointer-events-none"
        style={{ background: "radial-gradient(circle, #3b82f6, transparent 70%)" }}
      />

      <div className="max-w-6xl mx-auto px-6">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={inView ? { opacity: 1, y: 0 } : {}}
          transition={{ duration: 0.6 }}
          className="mb-16"
        >
          <span className="text-[#a78bfa] text-sm tracking-widest uppercase font-medium">sobre mim</span>
          <h2 className="text-white mt-2" style={{ fontSize: "clamp(1.8rem, 3vw, 2.5rem)", fontWeight: 700 }}>
            Quem é Linykeer?
          </h2>
        </motion.div>

        <div className="grid md:grid-cols-2 gap-16 items-center">
          {/* Image — Improved presentation */}
          <motion.div
            initial={{ opacity: 0, x: -40 }}
            animate={inView ? { opacity: 1, x: 0 } : {}}
            transition={{ duration: 0.7, delay: 0.1 }}
            className="relative"
          >
            {/* Main image with asymmetric frame */}
            <div className="relative">
              <div
                className="absolute -inset-px rounded-2xl opacity-60"
                style={{ background: "linear-gradient(135deg, #7c3aed, #3b82f6, transparent, transparent)" }}
              />
              <div className="relative rounded-2xl overflow-hidden aspect-[4/5]">
                <ImageWithFallback
                  src="https://images.unsplash.com/photo-1759884247447-beea12f8a207?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHx5b3VuZyUyMHdvbWFuJTIwZGV2ZWxvcGVyJTIwbGFwdG9wJTIwY29kaW5nfGVufDF8fHx8MTc3NzU1NjU3NXww&ixlib=rb-4.1.0&q=80&w=1080"
                  alt="Linykeer"
                  className="w-full h-full object-cover"
                />
                {/* Code overlay decoration */}
                <div
                  className="absolute inset-0"
                  style={{ background: "linear-gradient(to bottom, transparent 60%, rgba(10,10,15,0.8))" }}
                />
                <div className="absolute bottom-4 left-4 right-4 font-mono" style={{ fontSize: "0.65rem", color: "#a78bfa", opacity: 0.8 }}>
                  <p>{"const dev = {"}</p>
                  <p className="pl-4 text-[#60a5fa]">{"nome: 'Linykeer',"}</p>
                  <p className="pl-4 text-[#34d399]">{"foco: 'Frontend',"}</p>
                  <p className="pl-4 text-[#f472b6]">{"paixao: true"}</p>
                  <p>{"}"}</p>
                </div>
              </div>
            </div>

            {/* Floating accent element */}
            <div
              className="absolute -bottom-6 -right-6 w-32 h-32 rounded-2xl border border-white/10 bg-white/[0.03]"
              style={{ zIndex: -1 }}
            />
            <div
              className="absolute -top-4 -left-4 w-20 h-20 rounded-xl border border-[#7c3aed]/30 bg-[#7c3aed]/5"
              style={{ zIndex: -1 }}
            />
          </motion.div>

          {/* Text */}
          <div>
            <motion.p
              initial={{ opacity: 0, y: 20 }}
              animate={inView ? { opacity: 1, y: 0 } : {}}
              transition={{ duration: 0.6, delay: 0.2 }}
              className="text-white/70 mb-6"
              style={{ lineHeight: "1.8", fontSize: "1.05rem" }}
            >
              Sou uma desenvolvedora Front-End apaixonada por criar interfaces que
              unem beleza e funcionalidade. Acredito que cada linha de código pode
              impactar positivamente a vida das pessoas.
            </motion.p>
            <motion.p
              initial={{ opacity: 0, y: 20 }}
              animate={inView ? { opacity: 1, y: 0 } : {}}
              transition={{ duration: 0.6, delay: 0.3 }}
              className="text-white/50 mb-10"
              style={{ lineHeight: "1.8" }}
            >
              Trabalho com React, TypeScript, Tailwind CSS e outras tecnologias
              modernas para construir projetos incríveis. Sempre em busca de
              aprendizado e novos desafios.
            </motion.p>

            {/* Highlights grid */}
            <div className="grid grid-cols-2 gap-3">
              {highlights.map((item, i) => (
                <Card key={item.title} item={item} index={i} />
              ))}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
