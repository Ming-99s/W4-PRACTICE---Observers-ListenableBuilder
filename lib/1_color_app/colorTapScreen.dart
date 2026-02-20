import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week4/1_color_app/colorService.dart';
import 'package:week4/1_color_app/colorTap.dart';

class ColorTapsScreen extends StatelessWidget {
  const ColorTapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ColorService colorService = context.watch<ColorService>();
    return Scaffold(
      appBar: AppBar(title: const Text('Color Taps')),
      body: Column(
        children: colorService.taps.entries.map((entry) {
          return ColorTap(
            color: getColor(entry.key),
            tapCount: entry.value,
            onTap: () => colorService.increment(entry.key),
          );
        }).toList(),
      ),
    );
  }
}

Color getColor(ColorType type) {
  switch (type) {
    case ColorType.Blue:
      return Colors.blue;
    case ColorType.Red:
      return Colors.red;
    case ColorType.Yellow:
      return Colors.yellow;
    case ColorType.Green:
      return Colors.green;
  }
}
