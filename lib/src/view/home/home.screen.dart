import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/src/config/theming/theming.dart';
import 'package:flutter_template/src/view/shared/custom_tab.widget.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("appTitle".tr),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  ThemeConfigs.changeTheme();
                },
                icon: Icon(Get.isDarkMode ? Icons.wb_sunny : Icons.nightlight))
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomTabWidget(
                  isActive: true,
                  isDog: true,
                  onClick: () {},
                ),
                CustomTabWidget(
                  isActive: false,
                  isDog: false,
                  onClick: () {},
                ),
              ],
            )
          ],
        ));
  }
}
