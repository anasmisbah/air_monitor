import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Insets {
  static double offsetScale = 1;
  static double get xs => 4.w;
  static double get sm => 8.w;
  static double get med => 12.w;
  static double get lg => 16.w;
  static double get xl => 20.w;
  static double get base => 24.w;
  static double get xxl => 32.w;
  // Offset, used for the edge of the window, or to separate large sections in the app
  static double get offset => 40 * offsetScale;
}

class Shadows {
  // BOTTOM
  static List<BoxShadow> get shadow1 => [
        BoxShadow(
          color: const Color(0xFF000000).withOpacity(0.15),
          offset: const Offset(0, 1),
          blurRadius: 3,
          spreadRadius: 1
        ),
        BoxShadow(
          color: const Color(0xFF000000).withOpacity(0.3),
          offset: const Offset(0, 1),
          blurRadius: 2,
        ),
      ];
  static List<BoxShadow> get shadow2 => [
        BoxShadow(
          color: const Color(0xFF000000).withOpacity(0.15),
          offset: const Offset(0, 2),
          blurRadius: 6,
          spreadRadius: 2
        ),
        BoxShadow(
          color: const Color(0xFF000000).withOpacity(0.3),
          offset: const Offset(0, 1),
          blurRadius: 2,
        ),
      ];
  static List<BoxShadow> get shadow3 => [
        BoxShadow(
          color: const Color(0xFF000000).withOpacity(0.3),
          offset: const Offset(0, 1),
          blurRadius: 3,
        ),
        BoxShadow(
          color: const Color(0xFF000000).withOpacity(0.15),
          offset: const Offset(0, 4),
          blurRadius: 8,
          spreadRadius: 3,
        ),
      ];
  static List<BoxShadow> get shadow4 => [
        BoxShadow(
          color: const Color(0xFF000000).withOpacity(0.15),
          offset: const Offset(0, 6),
          blurRadius: 10,
          spreadRadius: 4
        ),
        BoxShadow(
          color: const Color(0xFF000000).withOpacity(0.25),
          offset: const Offset(0, 4),
          blurRadius: 4,
        ),
      ];
  static List<BoxShadow> get shadow5 => [
        BoxShadow(
          color: const Color(0xFF000000).withOpacity(0.15),
          offset: const Offset(0, 8),
          blurRadius: 12,
          spreadRadius: 6
        ),
        BoxShadow(
          color: const Color(0xFF000000).withOpacity(0.3),
          offset: const Offset(0, 4),
          blurRadius: 4,
        ),
      ];
  static List<BoxShadow> get shadow6 => [
        BoxShadow(
          color: const Color(0xFF0E1F35).withOpacity(0.12),
          offset: const Offset(0, 1),
          blurRadius: 4,
        ),
        BoxShadow(
          color: const Color(0xFF0E1F35).withOpacity(0.08),
          offset: const Offset(0, 4),
          blurRadius: 8,
        ),
      ];
}

