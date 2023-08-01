// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fav_places_v1/screen/map.dart';
import 'package:flutter/material.dart';

import 'package:fav_places_v1/models/place_model.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({
    Key? key,
    required this.place,
  }) : super(key: key);

  final Place place;

  String get locationImage {
    final lat = place.location.latitude;
    final lon = place.location.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lon=&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:S%7C$lat,$lon&key=AIzaSyB7PoV1BGkB-BZP8T-u_5-nVUGuV-9NPkE';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => MapScreen(
                          location: place.location,
                          isSelecting: false,
                        ),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(locationImage),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black54,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    place.location.address,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
