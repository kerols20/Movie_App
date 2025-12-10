import 'package:flutter/material.dart';

import 'custom_dailogs.dart';

abstract class Dialogs {
  static Future customDialog({
    required BuildContext context,
    List<Widget>? actions,
    Widget? content,
    bool isBarrierDismissible = true,
  }) {
    return showDialog(
      barrierDismissible: isBarrierDismissible,
      useSafeArea: true,
      context: context,
      builder: (context) =>
          CustomDialogContent(content: content, actions: actions),
    );
  }
}
