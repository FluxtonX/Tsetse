import 'package:flutter/material.dart';
import 'package:tsetse/views/Home_screen.dart';
import 'package:tsetse/views/splash_screen.dart';
import 'package:tsetse/views/wakeup_activation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const WakeupActivation(),
    );
  }
}
