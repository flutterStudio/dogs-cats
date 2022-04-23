import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/src/model/dog.model.dart';

class DogListItem extends StatelessWidget {
  const DogListItem({Key? key, required this.dog}) : super(key: key);
  final DogModel dog;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primary),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
            children: [
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              dog.photo ?? "",
                            )))),
              ),
            ],
          )),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "${dog.breed}",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontWeight: FontWeight.w600),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Expanded(
                            child: Text(
                          "${dog.breedType}",
                          style: Theme.of(context).textTheme.bodyText1,
                        )),
                      ],
                    ),
                    Text(
                      "hypoallergenic -  ${dog.hypoallergenic}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      "intelligence -  ${dog.intelligence}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      "popularity -  ${dog.popularity}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
