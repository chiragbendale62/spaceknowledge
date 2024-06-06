import 'package:flutter/material.dart';
import 'package:spaceknowledge/models/planet_model.dart';
import 'package:spaceknowledge/utilities/app_assets.dart';

class SearchProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  List<PlanetModel> planetsList = [
    PlanetModel(
      title: 'Mercury',
      subtitle: 'THE LIVING PLANET',
      imagePath: AppAssets.mercuryIcon,
    ),
    PlanetModel(
      title: 'Venus',
      subtitle: 'THE LIVING PLANET',
      imagePath: AppAssets.venusIcon,
    ),
    PlanetModel(
      title: 'Earth',
      subtitle: 'THE LIVING PLANET',
      imagePath: AppAssets.earthIcon,
    ),
    PlanetModel(
      title: 'Mars',
      subtitle: 'THE LIVING PLANET',
      imagePath: AppAssets.marsIcon,
    ),
    PlanetModel(
      title: 'Jupitor',
      subtitle: 'THE RED PLANET',
      imagePath: AppAssets.jupiterIcon,
    ),
    PlanetModel(
      title: 'Saturn',
      subtitle: 'THE GIANT PLANET',
      imagePath: AppAssets.saturnIcon,
    ),
    PlanetModel(
      title: 'Uranus',
      subtitle: 'THE GIANT PLANET',
      imagePath: AppAssets.uranusIcon,
    ),
    PlanetModel(
      title: 'Neptune',
      subtitle: 'THE GIANT PLANET',
      imagePath: AppAssets.neptuneIcon,
    ),
    PlanetModel(
      title: 'Pluto',
      subtitle: 'THE GIANT PLANET',
      imagePath: AppAssets.plutoIcon,
    ),
  ];
}
