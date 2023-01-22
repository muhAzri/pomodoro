import 'package:flutter/material.dart';
import 'package:gpt_pomodoro/pages/settings_page.dart';
import 'package:provider/provider.dart';

import '../provider/timer_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pomodoro Timer"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Consumer<TimerProvider>(
                builder: (context, timerProvider, child) {
                  return Text(
                    timerProvider.timeLeftFormatted,
                    style: const TextStyle(fontSize: 40),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              "Current Break: ",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Consumer<TimerProvider>(
              builder: (context, timerProvider, child) {
                return Text(
                  timerProvider.getBreakType(),
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text("Start"),
                  onPressed: () {
                    Provider.of<TimerProvider>(context, listen: false)
                        .startTimer();
                  },
                ),
                ElevatedButton(
                  child: const Text("Stop"),
                  onPressed: () {
                    Provider.of<TimerProvider>(context, listen: false)
                        .stopTimer();
                  },
                ),
                ElevatedButton(
                  child: const Text("Reset"),
                  onPressed: () {
                    Provider.of<TimerProvider>(context, listen: false)
                        .resetTimer();
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              child: const Text("Settings"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
