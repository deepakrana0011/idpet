import 'package:dog_app/locator.dart';
import 'package:dog_app/services/apiServices.dart';
import 'package:flutter/widgets.dart';
import '../enum/viewstate.dart';

class BaseProvider extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;
  Api api = locator<Api>();

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
