import 'package:flutter/material.dart';
import 'package:flutter_template/src/app.dart';
import 'package:flutter_template/src/config/app.config.dart';

void main() async {
  await AppConfig().init();

  runApp(const Application());
}
