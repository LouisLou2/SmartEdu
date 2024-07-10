import 'dart:ui';

import 'package:smart_edu/style/theme_vault.dart';

void uiInit(){
  ThemeVault.light = ThemeVault.light.copyWith(
      colorScheme: ThemeVault.light.colorScheme.copyWith(
        onInverseSurface: const Color(0xfff6f6f9),
        surfaceContainerHighest: const Color(0xfff4f4f4),
      ),
  );
}