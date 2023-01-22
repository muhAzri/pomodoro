import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/timer_provider.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  final TextEditingController pomodoroController =
      TextEditingController(text: '');
  final TextEditingController shortController = TextEditingController(text: '');
  final TextEditingController longController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    TimerProvider provider = Provider.of<TimerProvider>(context);

    pomodoroController.text = provider.getPomodoroDuration().toString();
    shortController.text = provider.getShortDuration().toString();
    longController.text = provider.getLongDuration().toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: pomodoroController,
              decoration: const InputDecoration(
                labelText: "Pomodoro Timer (minutes)",
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                Provider.of<TimerProvider>(context, listen: false)
                    .setPomodoroDuration(int.parse(value));
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: shortController,
              decoration: const InputDecoration(
                labelText: "Short Break Timer (minutes)",
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                Provider.of<TimerProvider>(context, listen: false)
                    .setShortBreakDuration(int.parse(value));
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: longController,
              decoration: const InputDecoration(
                labelText: "Long Break Timer (minutes)",
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                Provider.of<TimerProvider>(context, listen: false)
                    .setLongBreakDuration(int.parse(value));
              },
            ),
          ),
        ],
      ),
    );
  }
}
