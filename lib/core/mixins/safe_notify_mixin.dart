import 'package:flutter/material.dart';

mixin SafeNotifyMixin on ChangeNotifier {
  bool isDispose = false;

  void safeNotify() {
    if (!isDispose) notifyListeners();
  }

  @override
  dispose() {
    isDispose = true;
    super.dispose();
  }
}
