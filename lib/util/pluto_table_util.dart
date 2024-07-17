import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';
import 'package:smart_edu/extension/context_extension.dart';
import 'package:pluto_grid/pluto_grid.dart';

class PlutoTableUtil {
  static PlutoGridStyleConfig gridStyleConfig(BuildContext context) {
    return PlutoGridStyleConfig(
        cellTextStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w300,
        ),
        borderColor: Colors.transparent,
        gridBorderColor: Colors.transparent,
        activatedBorderColor:
            context.theme.colorScheme.primaryContainer.withOpacity(0.9),
        activatedColor:
            context.theme.colorScheme.primaryContainer.withOpacity(0.3));
  }
}
