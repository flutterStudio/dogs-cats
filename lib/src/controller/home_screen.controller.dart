import 'dart:convert';

import 'package:flutter_template/src/model/data.model.dart';
import 'package:flutter_template/src/model/dog.model.dart';
import 'package:flutter_template/src/utils/network.util.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class HomeScreenController extends GetxController {
  final Rx<int> _activeTab = 0.obs;
  int get activeTab => _activeTab.value;

  void changeTab(int value) {
    _activeTab.value = value;
  }

  // Dogs
  final Rx<Data<List<DogModel>>> _dogs = Rx(Data.none());
  Data<List<DogModel>> get dogs => _dogs.value;

  Future<void> getDogs() async {
    const String url =
        "https://gist.github.com/kastriotadili/acc722c9858189440d964db976303078";
    NetworkUtils.handleRequest<Data<List<DogModel>>>(
        request: () => GetConnect().get(url),
        handler: (response) async {
          List<DogModel> dogsList = [];
          var dogsData = jsonDecode(response.body)["dogBreeds"] as List;

          for (var dog in dogsData) {
            dogsList.add(DogModel.fromJson(dog));
          }
          return Data.succeed(data: dogsList);
        },
        onError: (error, message) async {
          return Data.faild(message: message!);
        });
  }
}
