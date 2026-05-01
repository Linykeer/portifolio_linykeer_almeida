import { motion } from "motion/react";
import { ArrowDown, Github, Linkedin, Mail, ExternalLink } from "lucide-react";
import { ImageWithFallback } from "./figma/ImageWithFallback";

export function Hero() {
  const scrollToProjects = () => {
    document.getElementById("projetos")?.scrollIntoView({ behavior: "smooth" });
  };

  const scrollToContact = () => {
    document.getElementById("contato")?.scrollIntoView({ behavior: "smooth" });
  };

  return (
    <section
      id="hero"
      className="relative min-h-screen flex items-center justify-center overflow-hidden bg-[#0a0a0f]"
    >
      {/* Ambient background blobs */}
      <div className="absolute inset-0 pointer-events-none">
        <div
          className="absolute top-1/4 left-1/4 w-[600px] h-[600px] rounded-full opacity-20 blur-3xl"
          style={{ background: "radial-gradient(circle, #7c3aed, transparent 70%)" }}
        />
        <div
          className="absolute bottom-1/4 right-1/4 w-[400px] h-[400px] rounded-full opacity-15 blur-3xl"
          style={{ background: "radial-gradient(circle, #2563eb, transparent 70%)" }}
        />
        {/* Grid pattern */}
        <div
          className="absolute inset-0 opacity-[0.03]"
          style={{
            backgroundImage:
              "linear-gradient(rgba(255,255,255,0.5) 1px, transparent 1px), linear-gradient(90deg, rgba(255,255,255,0.5) 1px, transparent 1px)",
            backgroundSize: "50px 50px",
          }}
        />
      </div>

      <div className="relative z-10 max-w-6xl mx-auto px-6 py-24 grid md:grid-cols-2 gap-16 items-center">
        {/* Left — Text */}
        <div>
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6 }}
            className="inline-flex items-center gap-2 px-4 py-2 rounded-full border border-[#7c3aed]/40 bg-[#7c3aed]/10 mb-6"
          >
            <span className="w-2 h-2 rounded-full bg-[#a78bfa] animate-pulse" />
            <span className="text-[#a78bfa] text-sm">Disponível para projetos</span>
          </motion.div>

          <motion.h1
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6, delay: 0.1 }}
            className="text-white mb-4"
            style={{ fontSize: "clamp(2.5rem, 5vw, 3.8rem)", lineHeight: "1.1", fontWeight: 700 }}
          >
            Oi, eu sou{" "}
            <span
              className="bg-clip-text text-transparent"
              style={{ backgroundImage: "linear-gradient(135deg, #a78bfa, #60a5fa)" }}
            >
              Linykeer
            </span>
          </motion.h1>

          <motion.p
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6, delay: 0.2 }}
            className="text-white/60 mb-8 max-w-md"
            style={{ fontSize: "1.1rem", lineHeight: "1.7" }}
          >
            Desenvolvedora Front-End apaixonada por criar experiências digitais
            bonitas e funcionais. Transformo ideias em interfaces que encantam.
          </motion.p>

          <motion.div
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6, delay: 0.3 }}
            className="flex flex-wrap gap-3 mb-10"
          >
            <button
              onClick={scrollToProjects}
              className="flex items-center gap-2 px-6 py-3 rounded-xl text-white font-medium transition-all duration-300 hover:scale-105 hover:shadow-lg"
              style={{
                background: "linear-gradient(135deg, #7c3aed, #3b82f6)",
                boxShadow: "0 4px 30px rgba(124, 58, 237, 0.3)",
              }}
            >
              Ver Projetos
              <ExternalLink size={16} />
            </button>
            <button
              onClick={scrollToContact}
              className="flex items-center gap-2 px-6 py-3 rounded-xl text-white/80 font-medium border border-white/15 hover:border-white/30 hover:text-white hover:bg-white/5 transition-all duration-300"
            >
              Entrar em Contato
            </button>
          </motion.div>

          {/* Social links */}
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ duration: 0.6, delay: 0.45 }}
            className="flex items-center gap-4"
          >
            {[
              { icon: Github, href: "https://github.com", label: "GitHub" },
              { icon: Linkedin, href: "https://linkedin.com", label: "LinkedIn" },
              { icon: Mail, href: "mailto:contato@linykeer.com.br", label: "E-mail" },
            ].map(({ icon: Icon, href, label }) => (
              <a
                key={label}
                href={href}
                target="_blank"
                rel="noopener noreferrer"
                aria-label={label}
                className="w-10 h-10 flex items-center justify-center rounded-xl border border-white/10 text-white/40 hover:text-white hover:border-white/30 hover:bg-white/5 transition-all duration-300"
              >
                <Icon size={18} />
              </a>
            ))}
            <span className="text-white/20 text-sm ml-2">/ me encontre</span>
          </motion.div>
        </div>

        {/* Right — Profile Image */}
        <motion.div
          initial={{ opacity: 0, scale: 0.85 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ duration: 0.8, delay: 0.2, ease: "easeOut" }}
          className="flex items-center justify-center"
        >
          <div className="relative">
            {/* Outer glow ring */}
            <div
              className="absolute inset-0 rounded-full blur-2xl opacity-60 scale-110"
              style={{ background: "linear-gradient(135deg, #7c3aed40, #3b82f640)" }}
            />

            {/* Spinning ring */}
            <motion.div
              animate={{ rotate: 360 }}
              transition={{ duration: 20, repeat: Infinity, ease: "linear" }}
              className="absolute -inset-3 rounded-full border border-dashed border-[#7c3aed]/30"
            />

            {/* Static decorative ring */}
            <div className="absolute -inset-1.5 rounded-full border border-[#7c3aed]/50" />

            {/* Photo frame */}
            <div
              className="relative w-[280px] h-[280px] md:w-[340px] md:h-[340px] rounded-full overflow-hidden border-2 border-white/10"
              style={{ boxShadow: "0 0 60px rgba(124, 58, 237, 0.3), 0 0 120px rgba(59, 130, 246, 0.15)" }}
            >
              <ImageWithFallback
                src="https://images.unsplash.com/photo-1759884247447-beea12f8a207?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHx5b3VuZyUyMHdvbWFuJTIwZGV2ZWxvcGVyJTIwbGFwdG9wJTIwY29kaW5nfGVufDF8fHx8MTc3NzU1NjU3NXww&ixlib=rb-4.1.0&q=80&w=1080"
                alt="Linykeer"
                className="w-full h-full object-cover"
              />
              {/* Subtle gradient overlay on the bottom */}
              <div
                className="absolute bottom-0 left-0 right-0 h-1/3"
                style={{ background: "linear-gradient(to top, rgba(10,10,15,0.5), transparent)" }}
              />
            </div>

            {/* Floating badges */}
            <motion.div
              initial={{ opacity: 0, x: 40 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ delay: 0.8, duration: 0.5 }}
              className="absolute -right-4 top-8 bg-[#18181f] border border-white/10 rounded-xl px-3 py-2 shadow-xl"
            >
              <div className="flex items-center gap-2">
                <span className="text-xl">⚛️</span>
                <div>
                  <p className="text-white text-xs font-medium">React</p>
                  <p className="text-white/40" style={{ fontSize: "0.68rem" }}>Frontend</p>
                </div>
              </div>
            </motion.div>

            <motion.div
              initial={{ opacity: 0, x: -40 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ delay: 1, duration: 0.5 }}
              className="absolute -left-8 bottom-12 bg-[#18181f] border border-white/10 rounded-xl px-3 py-2 shadow-xl"
            >
              <div className="flex items-center gap-2">
                <span className="text-xl">✨</span>
                <div>
                  <p className="text-white text-xs font-medium">2+ anos</p>
                  <p className="text-white/40" style={{ fontSize: "0.68rem" }}>Experiência</p>
                </div>
              </div>
            </motion.div>

            <motion.div
              initial={{ opacity: 0, y: 30 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 1.2, duration: 0.5 }}
              className="absolute left-1/2 -translate-x-1/2 -bottom-5 bg-[#18181f] border border-white/10 rounded-xl px-4 py-2 shadow-xl whitespace-nowrap"
            >
              <div className="flex items-center gap-2">
                <span className="w-2 h-2 rounded-full bg-emerald-400 animate-pulse" />
                <p className="text-white text-xs font-medium">Open to work 🇧🇷</p>
              </div>
            </motion.div>
          </div>
        </motion.div>
      </div>

      {/* Scroll indicator */}
      <motion.button
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: 1.5 }}
        onClick={scrollToProjects}
        className="absolute bottom-8 left-1/2 -translate-x-1/2 flex flex-col items-center gap-1 text-white/30 hover:text-white/60 transition-colors"
      >
        <span className="text-xs tracking-widest">SCROLL</span>
        <motion.div
          animate={{ y: [0, 6, 0] }}
          transition={{ duration: 1.5, repeat: Infinity }}
        >
          <ArrowDown size={16} />
        </motion.div>
      </motion.button>
    </section>
  );
}
