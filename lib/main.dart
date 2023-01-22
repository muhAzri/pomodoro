import 'package:flutter/material.dart';
import 'package:gpt_pomodoro/pages/home_page.dart';
import 'package:gpt_pomodoro/provider/timer_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimerProvider(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
