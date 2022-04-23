import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/src/model/dog.model.dart';

class DogListItem extends StatelessWidget {
  const DogListItem({Key? key, required this.dog}) : super(key: key);
  final DogModel dog;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primary),
      child: Row(
        children: [
          Expanded(
              child: Image.network(
            dog.photo ?? "",
            errorBuilder: (context, _, __) => const Text("error"),
          )),
          Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "${dog.breed}",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        "${dog.breedType}",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                  Text(
                    "hypoallergenic -  ${dog.hypoallergenic}",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    "intelligence -  ${dog.intelligence}",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    "popularity -  ${dog.popularity}",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
