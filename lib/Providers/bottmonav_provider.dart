import 'package:flutter/material.dart';
import 'package:tsetse/core/services/Bottnav_service.dart';

class BottomNavProvider with ChangeNotifier {
  final BottomNavService _service = BottomNavService();

  int get selectedIndex => _service.getIndex();

  void changeIndex(int index) {
    _service.updateIndex(index);
    notifyListeners();
  }
}
