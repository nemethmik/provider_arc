import 'package:flutter/foundation.dart';

mixin BaseVM on ChangeNotifier{
  @override bool get isWaiting => _isWaiting; bool _isWaiting = false; 
  @override startWaiting() {
    _isWaiting = true;
    notifyListeners();
  }
  @override stopWaiting() {
    _isWaiting = false;
    notifyListeners();
  }

}