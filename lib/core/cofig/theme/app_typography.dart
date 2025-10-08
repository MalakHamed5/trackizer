import 'package:flutter/material.dart';

/// Semantic roles you can use with [AppText].
enum TextRole {
  d1,
  d2,
  d3, // عناوين كبيرة جدًا (Display)
  h1,
  h2,
  h3, // عناوين الشاشات/الأقسام (Headings)
  title,
  subtitle,
  subtitle2, // عناوين أصغر للكروت والأقسام
  body,
  body2,
  caption, // نصوص عادية وكابشن
  label,
  label2,
  label3, // لابل الأزرار/التابات/الشيبس
}

class AppTypography {
  AppTypography._();

  /// Base text theme tuned to the dark UI shown in the designs.
  /// You can reuse it for light as well and recolor via [apply].
  static const TextTheme base = TextTheme(
    // Big marketing/display titles (e.g., "Subs\nSchedule")
    displayLarge: TextStyle(
      fontSize: 44,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.5,
    ),
    displayMedium: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.4,
    ),
    displaySmall: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),

    // Screen titles (e.g., Settings, Credit Cards)
    headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
    headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
    headlineSmall: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),

    // Section titles / cards headings (e.g., Spotify, $5.99)
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),

    // Body content
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),

    // Labels (chips, buttons, tab items, captions under icons)
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
    labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
  );

  /// Build a ThemeData with this text theme and recolor to the scheme.
  static ThemeData theme(ColorScheme scheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      textTheme: base.apply(
        bodyColor: scheme.onSecondaryContainer, //gray70
        displayColor: scheme.onPrimary, //white
      ),
    );
  }
}

/// Helper widget so you never write TextStyle by hand again.
class AppText extends StatelessWidget {
  const AppText(
    this.data, {
    super.key,
    this.role = TextRole.body,
    this.color,
    this.maxLines,
    this.overflow,
    this.align,
    this.fontWeight,
    this.height,
  });

  final String data;
  final TextRole role;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? align;
  final FontWeight? fontWeight;
  final double? height;

  TextStyle _resolve(BuildContext context) {
    final t = Theme.of(context).textTheme;
    switch (role) {
      case TextRole.d1:
        return t.displayLarge!;
      case TextRole.d2:
        return t.displayMedium!;
      case TextRole.d3:
        return t.displaySmall!;
      case TextRole.h1:
        return t.headlineLarge!;
      case TextRole.h2:
        return t.headlineMedium!;
      case TextRole.h3:
        return t.headlineSmall!;
      case TextRole.title:
        return t.titleLarge!;
      case TextRole.subtitle:
        return t.titleMedium!;
      case TextRole.subtitle2:
        return t.titleSmall!;
      case TextRole.body:
        return t.bodyLarge!;
      case TextRole.body2:
        return t.bodyMedium!;
      case TextRole.caption:
        return t.bodySmall!;
      case TextRole.label:
        return t.labelLarge!;
      case TextRole.label2:
        return t.labelMedium!;
      case TextRole.label3:
        return t.labelSmall!;
    }
  }

  @override
  Widget build(BuildContext context) {
    var style = _resolve(context);
    if (color != null || fontWeight != null || height != null) {
      style = style.copyWith(
        color: color,
        fontWeight: fontWeight,
        height: height,
      );
    }
    return Text(
      data,
      style: style,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: align,
    );
  }
}
