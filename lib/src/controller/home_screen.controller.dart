import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_template/src/model/cat.model.dart';
import 'package:flutter_template/src/model/data.model.dart';
import 'package:flutter_template/src/model/dog.model.dart';
import 'package:flutter_template/src/utils/network.util.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  @override
  void onInit() {
    getDogs();
    getCats();
    super.onInit();
  }

  final PageController _pageController = PageController(initialPage: 0);
  PageController get pageController => _pageController;
  final Rx<int> _activeTab = 0.obs;
  int get activeTab => _activeTab.value;

  void changeTab(int value) {
    _pageController.jumpToPage(value);
  }

  // Dogs
  final Rx<Data<List<DogModel>>> _dogs = Rx(Data.none());
  Data<List<DogModel>> get dogs => _dogs.value;

  Future<void> getDogs() async {
    _dogs.value = Data.inProgress();
    const String url =
        "https://gist.githubusercontent.com/kastriotadili/acc722c9858189440d964db976303078/raw/ba63ffd45a76e54fd816ff471e9f3ac348e983b7/dog-breeds-data.json";
    Data<List<DogModel>> data =
        await NetworkUtils.handleRequest<Data<List<DogModel>>>(
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
    _dogs.value = data;
  }

  // Cats
  final Rx<Data<List<CatModel>>> _cats = Rx(Data.none());
  Data<List<CatModel>> get cats => _cats.value;

  Future<void> getCats() async {
    int catsCount = 0;
    List<CatModel> catsData = [];
    _dogs.value = Data.inProgress();
    while (catsCount < 10 * _cats.value.page) {
      Data<CatModel> cat = await getCat();
      if (cat.isSucceed) {
        catsData.add(cat.data!);
        catsCount++;
      } else {
        _cats.value = Data.faild(message: "error-unknown".tr);
        return;
      }
    }
    _cats.value.page++;
    _cats.value.data?.addAll(catsData);
  }

  Future<Data<CatModel>> getCat() async {
    const String url = "https://cataas.com/cat?json=true";
    Data<CatModel> data = await NetworkUtils.handleRequest<Data<CatModel>>(
        request: () => GetConnect().get(url),
        handler: (response) async {
          CatModel? cat;
          var catData = jsonDecode(response.body);

          cat = CatModel.fromJson(catData);
          if (cat.id != null) {
            cat.image = "https://cataas.com/cat/${cat.id}";
          }
          return Data.succeed(data: cat);
        },
        onError: (error, message) async {
          return Data.faild(message: message!);
        });
    return data;
  }
}
