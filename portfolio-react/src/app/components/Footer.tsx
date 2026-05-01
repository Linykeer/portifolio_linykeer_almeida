export function Footer() {
  return (
    <footer className="py-8 border-t border-white/5 bg-[#0a0a0f]">
      <div className="max-w-6xl mx-auto px-6 flex flex-col md:flex-row items-center justify-between gap-3">
        <span className="text-white/20 text-sm">
          © 2025 Linykeer. Feito com{" "}
          <span className="text-[#f472b6]">♥</span> e muito café.
        </span>
        <span className="text-white/20 text-sm font-mono">
          {"<"} React + Tailwind {"/>"}
        </span>
      </div>
    </footer>
  );
}
