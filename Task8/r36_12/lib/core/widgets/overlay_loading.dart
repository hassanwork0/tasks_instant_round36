import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../colors/colors_app.dart';

class OverlayLoading {
  static BuildContext? _dialogContext;
  static void show(BuildContext context) {
    if (_dialogContext != null) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        _dialogContext = context;
        return PopScope(
          canPop: false,
          child: Center(
            child: const SpinKitCircle(color: ColorsApp.whiteColor, size: 50.0),
          ),
        );
      },
    ).then((_) {
      _dialogContext = null;
    });
  }

  static void hide() {
    if (_dialogContext != null && _dialogContext!.mounted) {
      Navigator.of(_dialogContext!).pop();
      _dialogContext = null;
    }
  }
}
