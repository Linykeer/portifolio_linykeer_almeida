import 'package:flutter/material.dart';

class AppColors {
  // Tons principais
  static const Color primary = Color(
    0xFF2F81F7,
  ); // azul médio moderno (ligeiramente mais vibrante)
  static const Color primaryDark = Color(0xFF0F172A); // azul escuro de apoio

  // Acentos e destaques
  static const Color accent = Color(
    0xFF00C6AE,
  ); // verde-água sofisticado para CTAs
  static const Color accentHover = Color(0xFF14B8A6);

  // Fundo e superfícies
  static const Color background = Color(
    0xFF1B1B1E,
  ); // **cinza grafite principal**
  static const Color surface = Color(0xFF242427); // cards / containers
  static const Color surfaceLight = Color(
    0xFF2E2E31,
  ); // elementos flutuantes / appbar

  // Texto
  static const Color textPrimary = Color(
    0xFFF1F5F9,
  ); // quase branco, ótimo contraste
  static const Color textSecondary = Color(0xFFCBD5E1); // cinza leve
  static const Color textMuted = Color(0xFF94A3B8); // cinza-azulado suave

  // Bordas
  static const Color border = Color(0xFF3A3A3E);
  static const Color borderLight = Color(0xFF4B4B50);

  // Estados de feedback
  static const Color success = Color(0xFF10B981); // verde elegante
  static const Color warning = Color(0xFFF59E0B); // dourado
  static const Color error = Color(0xFFEF4444); // vermelho
}
