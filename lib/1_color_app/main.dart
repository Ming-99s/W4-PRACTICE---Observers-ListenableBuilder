import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week4/1_color_app/colorService.dart';
import 'package:week4/1_color_app/home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ColorService(),
      child:         MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(body: Home()),
        ),

      
    ),
  );
}
