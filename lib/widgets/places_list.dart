// ignore_for_file: public_member_api_docs, sort_constructors_first
// widget for the places list

import 'package:fav_places_v1/models/place_model.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  final List<Place> places;

  const PlacesList({
    Key? key,
    required this.places,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'You have no data...',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }
    return ListView.builder(
        itemCount: places.length,
        itemBuilder: (ctx, index) => ListTile(
              title: Text(
                places[index].title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ));
  }
}
