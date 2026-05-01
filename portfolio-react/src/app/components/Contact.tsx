import { useRef, useState } from "react";
import { motion, useInView } from "motion/react";
import { Mail, MapPin, Github, Linkedin, Send, CheckCircle } from "lucide-react";

export function Contact() {
  const sectionRef = useRef(null);
  const inView = useInView(sectionRef, { once: true, margin: "-80px" });
  const [sent, setSent] = useState(false);
  const [form, setForm] = useState({ name: "", email: "", message: "" });

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    setSent(true);
    setTimeout(() => setSent(false), 4000);
    setForm({ name: "", email: "", message: "" });
  };

  return (
    <section id="contato" ref={sectionRef} className="py-28 bg-[#0c0c14] relative overflow-hidden">
      <div
        className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[600px] h-[300px] opacity-10 blur-3xl pointer-events-none"
        style={{ background: "radial-gradient(ellipse, #7c3aed, transparent 70%)" }}
      />

      <div className="max-w-6xl mx-auto px-6">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={inView ? { opacity: 1, y: 0 } : {}}
          transition={{ duration: 0.6 }}
          className="text-center mb-14"
        >
          <span className="text-[#a78bfa] text-sm tracking-widest uppercase font-medium">contato</span>
          <h2 className="text-white mt-2" style={{ fontSize: "clamp(1.8rem, 3vw, 2.5rem)", fontWeight: 700 }}>
            Vamos conversar?
          </h2>
          <p className="text-white/50 mt-3 max-w-md mx-auto">
            Estou aberta a novas oportunidades e colaborações. Entre em contato!
          </p>
        </motion.div>

        <div className="grid md:grid-cols-2 gap-12 items-start">
          {/* Info */}
          <motion.div
            initial={{ opacity: 0, x: -30 }}
            animate={inView ? { opacity: 1, x: 0 } : {}}
            transition={{ duration: 0.6, delay: 0.1 }}
          >
            <div className="space-y-5 mb-10">
              {[
                {
                  icon: Mail,
                  label: "E-mail",
                  value: "contato@linykeer.com.br",
                  href: "mailto:contato@linykeer.com.br",
                  color: "#a78bfa",
                },
                {
                  icon: MapPin,
                  label: "Localização",
                  value: "Brasil 🇧🇷",
                  href: "#",
                  color: "#60a5fa",
                },
              ].map(({ icon: Icon, label, value, href, color }) => (
                <a
                  key={label}
                  href={href}
                  className="flex items-center gap-4 p-4 rounded-xl border border-white/8 bg-white/[0.02] hover:bg-white/[0.05] hover:border-white/15 transition-all group"
                >
                  <div
                    className="w-10 h-10 rounded-xl flex items-center justify-center flex-shrink-0"
                    style={{ background: `${color}15`, border: `1px solid ${color}30` }}
                  >
                    <Icon size={18} style={{ color }} />
                  </div>
                  <div>
                    <p className="text-white/40 text-xs">{label}</p>
                    <p className="text-white/80 text-sm group-hover:text-white transition-colors">{value}</p>
                  </div>
                </a>
              ))}
            </div>

            {/* Social */}
            <div>
              <p className="text-white/40 text-xs uppercase tracking-widest mb-4">Redes Sociais</p>
              <div className="flex gap-3">
                {[
                  { icon: Github, href: "https://github.com", label: "GitHub" },
                  { icon: Linkedin, href: "https://linkedin.com", label: "LinkedIn" },
                  { icon: Mail, href: "mailto:contato@linykeer.com.br", label: "Email" },
                ].map(({ icon: Icon, href, label }) => (
                  <a
                    key={label}
                    href={href}
                    target="_blank"
                    rel="noopener noreferrer"
                    aria-label={label}
                    className="w-11 h-11 flex items-center justify-center rounded-xl border border-white/10 text-white/40 hover:text-white hover:border-[#7c3aed]/50 hover:bg-[#7c3aed]/10 transition-all"
                  >
                    <Icon size={18} />
                  </a>
                ))}
              </div>
            </div>
          </motion.div>

          {/* Form */}
          <motion.div
            initial={{ opacity: 0, x: 30 }}
            animate={inView ? { opacity: 1, x: 0 } : {}}
            transition={{ duration: 0.6, delay: 0.2 }}
          >
            <form
              onSubmit={handleSubmit}
              className="rounded-2xl border border-white/8 bg-white/[0.02] p-6 space-y-4"
            >
              {[
                { id: "name", label: "Seu nome", type: "text", placeholder: "Linykeer" },
                { id: "email", label: "Seu e-mail", type: "email", placeholder: "seu@email.com" },
              ].map(({ id, label, type, placeholder }) => (
                <div key={id}>
                  <label className="block text-white/60 text-sm mb-2">{label}</label>
                  <input
                    type={type}
                    required
                    value={form[id as keyof typeof form]}
                    onChange={(e) => setForm((f) => ({ ...f, [id]: e.target.value }))}
                    placeholder={placeholder}
                    className="w-full px-4 py-3 rounded-xl bg-white/[0.04] border border-white/10 text-white placeholder-white/25 outline-none focus:border-[#7c3aed]/60 focus:bg-white/[0.06] transition-all text-sm"
                  />
                </div>
              ))}

              <div>
                <label className="block text-white/60 text-sm mb-2">Mensagem</label>
                <textarea
                  required
                  rows={4}
                  value={form.message}
                  onChange={(e) => setForm((f) => ({ ...f, message: e.target.value }))}
                  placeholder="Olá, adorei seu portfólio! Quero conversar sobre..."
                  className="w-full px-4 py-3 rounded-xl bg-white/[0.04] border border-white/10 text-white placeholder-white/25 outline-none focus:border-[#7c3aed]/60 focus:bg-white/[0.06] transition-all text-sm resize-none"
                />
              </div>

              <motion.button
                type="submit"
                whileHover={{ scale: 1.02 }}
                whileTap={{ scale: 0.98 }}
                className="w-full flex items-center justify-center gap-2 py-3 rounded-xl text-white font-medium transition-all"
                style={{
                  background: sent
                    ? "linear-gradient(135deg, #059669, #34d399)"
                    : "linear-gradient(135deg, #7c3aed, #3b82f6)",
                  boxShadow: "0 4px 20px rgba(124,58,237,0.25)",
                }}
              >
                {sent ? (
                  <>
                    <CheckCircle size={17} /> Mensagem enviada!
                  </>
                ) : (
                  <>
                    <Send size={17} /> Enviar mensagem
                  </>
                )}
              </motion.button>
            </form>
          </motion.div>
        </div>
      </div>
    </section>
  );
}
