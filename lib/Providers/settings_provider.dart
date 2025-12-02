import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  bool preAlarm = true;
  bool autoNotify = true;
  bool autoNotify2 = true;
  bool autoNotify3 = true;

  bool adaptiveVolume = true;
  bool vibrationPattern = true;

  bool cameraAccess1 = true;
  bool cameraAccess2 = true;
  bool cameraAccess3 = true;

  void togglePreAlarm(bool value) {
    preAlarm = value;
    notifyListeners();
  }

  void toggleAutoNotify(bool value) {
    autoNotify = value;
    notifyListeners();
  }

  void toggleAutoNotify2(bool value) {
    autoNotify2 = value;
    notifyListeners();
  }

  void toggleAutoNotify3(bool value) {
    autoNotify3 = value;
    notifyListeners();
  }

  void toggleAdaptiveVolume(bool value) {
    adaptiveVolume = value;
    notifyListeners();
  }

  void toggleVibration(bool value) {
    vibrationPattern = value;
    notifyListeners();
  }

  void toggleCamera1(bool value) {
    cameraAccess1 = value;
    notifyListeners();
  }

  void toggleCamera2(bool value) {
    cameraAccess2 = value;
    notifyListeners();
  }

  void toggleCamera3(bool value) {
    cameraAccess3 = value;
    notifyListeners();
  }
}
