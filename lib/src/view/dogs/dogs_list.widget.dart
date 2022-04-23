import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/src/controller/home_screen.controller.dart';
import 'package:flutter_template/src/model/dog.model.dart';
import 'package:flutter_template/src/view/dogs/dog_list_item.widget.dart';
import 'package:flutter_template/src/view/shared/data_handler.widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class DogList extends GetView<HomeScreenController> {
  const DogList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => DataHandler<List<DogModel>>(
        onSuccess: (context, data) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) => DogListItem(dog: data[index])),
        data: controller.dogs));
  }
}
