import 'package:flutter/material.dart';
import './../enum/enum.dart';

class BaseViewModel extends ChangeNotifier {
  ViewStateType _state = ViewStateType.Idle;
  int _currnentPage;

  ViewStateType get state => _state;
  int get currentPage => _currnentPage;

  void setState(ViewStateType viewState) {
    _state = viewState;
    notifyListeners();
  }
  void setCurrentPage(int index) {
    _currnentPage = index;
    notifyListeners();
  }
}