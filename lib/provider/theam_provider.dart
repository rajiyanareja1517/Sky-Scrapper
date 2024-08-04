import 'package:flutter/cupertino.dart';

class TheamProvider extends ChangeNotifier {
  bool isDark = false;

  void changeTheam() {
    isDark = !isDark;
    notifyListeners();
  }
}
