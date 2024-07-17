import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:smart_edu/data/key_data.dart';

class ToastHelper {
  static void showSuccessToast(String message) {
    ShadToaster.of(GlobalKeyData.currentContext).show(
      ShadToast(
        title: Text(message),
      ),
    );
  }

  static void showFaultToast(String message) {
    ShadToaster.of(GlobalKeyData.currentContext).show(
      ShadToast.destructive(
        title: Text(message),
        action: ShadButton.destructive(
          text: const Text('Dismiss'),
          decoration: const ShadDecoration(
            border: ShadBorder(
              color: Colors.white,
            ),
          ),
          onPressed: () => ShadToaster.of(GlobalKeyData.currentContext).hide(),
        ),
      ),
    );
  }
}
