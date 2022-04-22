import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTabWidget extends StatelessWidget {
  const CustomTabWidget({
    Key? key,
    required this.isActive,
    required this.isDog,
  }) : super(key: key);
  final bool isActive;
  final bool isDog;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          "assets/icons/${isDog ? 'dog' : 'cat'}${isActive ? '-active' : ''}.svg",
          width: 70,
          color: isActive
              ? Theme.of(context).colorScheme.primaryVariant
              : Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(height: 15),
        Text(
          isDog ? "Dogs" : "Cats",
          style: Theme.of(context).textTheme.headline5!.copyWith(
                fontFamily: 'Inder',
                color: isActive
                    ? Theme.of(context).colorScheme.primaryVariant
                    : Theme.of(context).colorScheme.primary,
              ),
        )
      ],
    );
  }
}
