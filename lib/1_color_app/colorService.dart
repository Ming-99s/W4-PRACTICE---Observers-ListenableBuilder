import 'package:flutter/material.dart';

enum ColorType { Red, Blue, Yellow, Green }

class ColorService extends ChangeNotifier {
  Map<ColorType, int> taps = {
    for (var eachColor in ColorType.values) eachColor: 0,
  };

  void increment(ColorType type) {
    if (taps.containsKey(type)) {
      taps[type] = taps[type]! + 1;
      notifyListeners();
    }
  }
}

// Global instance (no drilling)
// final colorService = ColorService();
