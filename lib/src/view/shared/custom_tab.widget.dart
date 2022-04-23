import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTabWidget extends StatelessWidget {
  const CustomTabWidget({
    Key? key,
    required this.isActive,
    required this.isDog,
    required this.onClick,
  }) : super(key: key);
  final bool isActive;
  final bool isDog;
  final VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/${isDog ? 'dog' : 'cat'}${isActive ? '-active' : ''}.svg",
              width: 30,
              color: isActive
                  ? Theme.of(context).colorScheme.primaryVariant
                  : Theme.of(context)
                      .colorScheme
                      .primaryVariant
                      .withOpacity(0.5),
            ),
            const SizedBox(width: 15),
            Text(
              isDog ? "Dogs" : "Cats",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontFamily: 'Inder',
                    color: isActive
                        ? Theme.of(context).colorScheme.primaryVariant
                        : Theme.of(context)
                            .colorScheme
                            .primaryVariant
                            .withOpacity(0.5),
                  ),
            )
          ],
        ),
      ),
    );
  }
}
