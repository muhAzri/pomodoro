import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider with ChangeNotifier {
  int _pomodoroDuration = 25;
  int _shortBreakDuration = 5;
  int _longBreakDuration = 10;
  int _timeLeft = 0;
  late Timer _timer;
  String _timeLeftFormatted = "00:00";
  String _breakType = "pomodoro";
  int _pomodorosCompleted = 0;
  bool _isPlaying = false;

  int get pomodoroDuration => _pomodoroDuration;
  int get shortBreakDuration => _shortBreakDuration;
  int get longBreakDuration => _longBreakDuration;
  int get timeLeft => _timeLeft;
  String get timeLeftFormatted => _timeLeftFormatted;

  getPomodoroDuration() {
    return _pomodoroDuration;
  }

  getShortDuration() {
    return _shortBreakDuration;
  }

  getLongDuration() {
    return _longBreakDuration;
  }

  getBreakType() {
    return _breakType;
  }

  setPomodoroDuration(int duration) {
    _pomodoroDuration = duration;
    notifyListeners();
  }

  setShortBreakDuration(int duration) {
    _shortBreakDuration = duration;
    notifyListeners();
  }

  setLongBreakDuration(int duration) {
    _longBreakDuration = duration;
    notifyListeners();
  }

  startTimer() async {
    if (_breakType == "pomodoro") {
      _timeLeft = _pomodoroDuration * 60;
    } else if (_breakType == "short") {
      _timeLeft = _shortBreakDuration * 60;
    } else {
      _timeLeft = _longBreakDuration * 60;
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _timeLeft--;
      _timeLeftFormatted =
          "${(_timeLeft ~/ 60).toString().padLeft(2, '0')}:${(_timeLeft % 60).toString().padLeft(2, '0')}";
      if (_timeLeft == 0) {
        _timer.cancel();
        _isPlaying = false;
        if (_breakType == "pomodoro") {
          _pomodorosCompleted++;
          if (_pomodorosCompleted % 4 == 0) {
            _breakType = "long";
          } else {
            _breakType = "short";
          }
        } else {
          _breakType = "pomodoro";
        }
        startTimer();
      }
      notifyListeners();
    });
  }

  stopTimer() {
    _timer.cancel();
    _pomodorosCompleted = 0;
    _breakType = "pomodoro";
  }

  resetTimer() {
    _timeLeft = _pomodoroDuration * 60;
    _timeLeftFormatted = "${_timeLeft ~/ 60}:${_timeLeft % 60}";
    _pomodorosCompleted = 0;
    _breakType = "pomodoro";
    notifyListeners();
  }
}
