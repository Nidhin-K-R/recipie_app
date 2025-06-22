import 'package:flutter/material.dart';

class ButtonProvider extends ChangeNotifier {
  bool click = true;
  changeIcon() {
    click = !click;
    notifyListeners();
  }
}
