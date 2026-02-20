import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week4/1_color_app/colorService.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ColorService colorService = context.watch<ColorService>();

    return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: colorService.taps.entries.map((entries) {
            return Text('${entries.key.name} = ${entries.value}');
          }).toList(),
        ),
      ),
    );
  }
}
