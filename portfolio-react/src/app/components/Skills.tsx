import { useRef } from "react";
import { motion, useInView } from "motion/react";

const skillGroups = [
  {
    label: "Frontend",
    color: "#a78bfa",
    skills: [
      { name: "React / Next.js", level: 90 },
      { name: "TypeScript", level: 85 },
      { name: "Tailwind CSS", level: 92 },
      { name: "HTML & CSS", level: 95 },
    ],
  },
  {
    label: "Ferramentas",
    color: "#60a5fa",
    skills: [
      { name: "Git & GitHub", level: 88 },
      { name: "Figma", level: 80 },
      { name: "Vite / Webpack", level: 78 },
      { name: "Node.js", level: 70 },
    ],
  },
];

const techBadges = [
  "React", "Next.js", "TypeScript", "JavaScript", "Tailwind CSS",
  "Styled-Components", "HTML5", "CSS3", "Git", "GitHub", "Figma",
  "Node.js", "REST APIs", "React Native", "Vite", "Zustand",
];

function SkillBar({ name, level, color, delay }: { name: string; level: number; color: string; delay: number }) {
  const ref = useRef(null);
  const inView = useInView(ref, { once: true, margin: "-30px" });

  return (
    <div ref={ref} className="mb-4">
      <div className="flex justify-between mb-1.5">
        <span className="text-white/80 text-sm">{name}</span>
        <span className="text-white/40 text-sm">{level}%</span>
      </div>
      <div className="h-1.5 rounded-full bg-white/8 overflow-hidden">
        <motion.div
          initial={{ width: 0 }}
          animate={inView ? { width: `${level}%` } : {}}
          transition={{ duration: 1, delay, ease: "easeOut" }}
          className="h-full rounded-full"
          style={{ background: `linear-gradient(90deg, ${color}, ${color}80)` }}
        />
      </div>
    </div>
  );
}

export function Skills() {
  const sectionRef = useRef(null);
  const inView = useInView(sectionRef, { once: true, margin: "-80px" });

  return (
    <section id="skills" ref={sectionRef} className="py-28 bg-[#0a0a0f] relative overflow-hidden">
      <div
        className="absolute bottom-0 right-0 w-[400px] h-[400px] opacity-10 blur-3xl pointer-events-none"
        style={{ background: "radial-gradient(circle, #a78bfa, transparent 70%)" }}
      />

      <div className="max-w-6xl mx-auto px-6">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={inView ? { opacity: 1, y: 0 } : {}}
          transition={{ duration: 0.6 }}
          className="mb-14"
        >
          <span className="text-[#a78bfa] text-sm tracking-widest uppercase font-medium">habilidades</span>
          <h2 className="text-white mt-2" style={{ fontSize: "clamp(1.8rem, 3vw, 2.5rem)", fontWeight: 700 }}>
            Tecnologias que uso
          </h2>
        </motion.div>

        <div className="grid md:grid-cols-2 gap-12 mb-16">
          {skillGroups.map((group, gi) => (
            <motion.div
              key={group.label}
              initial={{ opacity: 0, y: 30 }}
              animate={inView ? { opacity: 1, y: 0 } : {}}
              transition={{ duration: 0.6, delay: gi * 0.15 }}
            >
              <div className="flex items-center gap-3 mb-6">
                <div
                  className="w-1 h-6 rounded-full"
                  style={{ background: `linear-gradient(to bottom, ${group.color}, transparent)` }}
                />
                <h3 className="text-white font-semibold">{group.label}</h3>
              </div>
              {group.skills.map((skill, i) => (
                <SkillBar
                  key={skill.name}
                  name={skill.name}
                  level={skill.level}
                  color={group.color}
                  delay={gi * 0.2 + i * 0.1}
                />
              ))}
            </motion.div>
          ))}
        </div>

        {/* Tech badges cloud */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={inView ? { opacity: 1, y: 0 } : {}}
          transition={{ duration: 0.6, delay: 0.4 }}
          className="rounded-2xl border border-white/8 bg-white/[0.02] p-8"
        >
          <p className="text-white/40 text-xs uppercase tracking-widest mb-5">Todas as tecnologias</p>
          <div className="flex flex-wrap gap-3">
            {techBadges.map((tech, i) => (
              <motion.span
                key={tech}
                initial={{ opacity: 0, scale: 0.8 }}
                animate={inView ? { opacity: 1, scale: 1 } : {}}
                transition={{ duration: 0.3, delay: 0.5 + i * 0.04 }}
                whileHover={{ scale: 1.08, borderColor: "#a78bfa80", color: "#e2d9fa" }}
                className="px-3 py-1.5 rounded-xl text-sm text-white/60 border border-white/8 bg-white/[0.03] cursor-default transition-colors"
              >
                {tech}
              </motion.span>
            ))}
          </div>
        </motion.div>
      </div>
    </section>
  );
}
