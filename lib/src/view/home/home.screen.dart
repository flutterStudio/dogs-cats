import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/src/controller/home_screen.controller.dart';
import 'package:flutter_template/src/view/cats/cats_grid.widget.dart';
import 'package:flutter_template/src/view/dogs/dogs_list.widget.dart';
import 'package:flutter_template/src/view/shared/custom_tab.widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          GetX<HomeScreenController>(
            builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        color: Theme.of(context).colorScheme.primaryVariant,
                        onPressed: () {
                          Get.updateLocale(Locale(
                              Get.locale!.languageCode == "en" ? "ar" : "en"));
                        },
                        icon: const Icon(
                          Icons.language_outlined,
                          size: 20,
                        )),
                    Text(
                      Get.locale!.languageCode == "en" ? "ar".tr : "en".tr,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          fontFamily: 'Inder',
                          color: Theme.of(context).colorScheme.primaryVariant),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: CustomTabWidget(
                        isActive: controller.activeTab == 0,
                        isDog: true,
                        onClick: () {
                          Get.find<HomeScreenController>().changeTab(0);
                        },
                      )),
                      Expanded(
                          child: CustomTabWidget(
                        isActive: controller.activeTab == 1,
                        isDog: false,
                        onClick: () {
                          Get.find<HomeScreenController>().changeTab(1);
                        },
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: Container(
            child: GetBuilder<HomeScreenController>(
              builder: (controller) => PageView(
                onPageChanged: (index) {
                  controller.changeTab(index);
                },
                controller: controller.pageController,
                children: const [DogList(), CatsGrid()],
              ),
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(15), right: Radius.circular(15))),
          ))
        ],
      ),
    ));
  }
}
