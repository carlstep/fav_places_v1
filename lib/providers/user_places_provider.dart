// riverpod provider for user places

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fav_places_v1/models/place_model.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(String title) {
    final newPlace = Place(title: title);
    state = [newPlace, ...state];
  }
}

final userPlacesProvider = StateNotifierProvider((ref) => UserPlacesNotifier());
