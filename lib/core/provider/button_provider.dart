import 'package:flutter/material.dart';

class ButtonProvider extends ChangeNotifier {
  bool click = false;
  changeIcon() {
    click = !click;
    notifyListeners();
  }
}
