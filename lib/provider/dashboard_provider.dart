import 'package:flutter/cupertino.dart';

import 'base_provider.dart';

class DashboardProvider extends BaseProvider {
  int _selectedIndex = 0;

  var unRespondedInvite = 0;
  var unRespondedEvent = 0;

  set selectedIndex(int value) {
    _selectedIndex = value;
  }

  int get selectedIndex => _selectedIndex;

  void onItemTapped(int index) {
    _selectedIndex = index;

    notifyListeners();
  }

  updateEventNotificationCount() {
    unRespondedEvent--;
    notifyListeners();
  }

  updateInvitesNotificationCount() {
    unRespondedInvite--;
    notifyListeners();
  }
}
