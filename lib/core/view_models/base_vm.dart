import 'package:flutter/material.dart';
import 'package:shop_app/core/enums/view_state.dart';

class BaseVM extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  void applyState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
