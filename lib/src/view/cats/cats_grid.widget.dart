import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_template/src/controller/home_screen.controller.dart';
import 'package:flutter_template/src/model/cat.model.dart';
import 'package:flutter_template/src/model/dog.model.dart';
import 'package:flutter_template/src/view/shared/data_handler.widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CatsGrid extends GetView<HomeScreenController> {
  const CatsGrid({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => DataHandler<List<DogModel>>(
        onErrorRetry: () {
          controller.getCats();
        },
        onSuccess: (context, data) => MasonryGridView.builder(
              itemCount: data.length,
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => Container(
                color: Colors.accents[index],
              ),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            ),
        data: controller.dogs));
  }
}
