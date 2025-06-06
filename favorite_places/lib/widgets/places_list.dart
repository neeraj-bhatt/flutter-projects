import 'package:favorite_places/screens/place_detail_screen.dart';
import 'package:flutter/material.dart';

import 'package:favorite_places/models/place.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});
  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'Nothing to Show',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      );
    }

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, index) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => PlaceDetailScreen(place: places[index]),
                ));
          },
          title: Text(
            places[index].title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          leading: CircleAvatar(
            radius: 26.0,
            backgroundImage: FileImage(places[index].image),
          ),
        ),
      ),
    );
  }
}
