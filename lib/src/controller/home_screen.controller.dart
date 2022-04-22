import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class HomeScreenController extends GetxController {
  final Rx<int> _activeTab = 0.obs;
  int get activeTab => _activeTab.value;

  void changeTab(int value) {
    _activeTab.value = value;
  }
}
