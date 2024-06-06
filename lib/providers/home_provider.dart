import 'package:flutter/material.dart';
import 'package:spaceknowledge/models/planet_model.dart';
import 'package:spaceknowledge/utilities/app_assets.dart';
import 'package:spaceknowledge/utilities/app_colors.dart';

class HomeProvider extends ChangeNotifier {
  // pageview selected index
  int currentIndex = 0;

  var pageController = PageController(
    initialPage: 0,
    keepPage: true,
    viewportFraction: 1,
  );

  onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List<PlanetModel> globesList = [
    PlanetModel(
      title: 'MERCURY',
      subtitle: 'THE LIVING PLANET',
      imagePath: AppAssets.mercuryGlobe,
      shadowColor: AppColors.mercuryShadowColor,
      planetDetails: PlanetDetails(
        description: "Mercury is the first and smallest planet in our solar system. "
            "It’s just a little bigger than Earth’s Moon. Mercury itself, though, "
            "doesn’t have any moons. It is the closest planet to the Sun, but it’s "
            "actually not the hottest. Venus is hotter.\n\n"
            "Along with Venus, Earth, and Mars, Mercury is one of the rocky planets."
            " It has a solid surface that is covered with craters. Instead of an atmosphere, "
            "Mercury possesses a thin exosphere made up of atoms blasted off the surface by "
            "the solar wind and striking meteoroids. Mercury's exosphere is composed mostly of "
            "oxygen, sodium, hydrogen, helium, and potassium. Mercury doesn’t have any moons.",
        distanceFromSun: "58 million km",
        lengthOfDay: "59d 0h 0m",
        orbitalPeriod: "88 days",
        radius: "2,439.7 km",
        mass: "3.285 × 10^23 kg (0.055 M⊕)",
        gravity: "3.7 m/s²",
        surfaceArea: "74.8 million km²",
      ),
    ),
    PlanetModel(
      title: 'VENUS',
      subtitle: 'THE LIVING PLANET',
      imagePath: AppAssets.venusGlobe,
      shadowColor: AppColors.venusShadowColor,
      planetDetails: PlanetDetails(
        description: "Venus is the second planet from the Sun. It is a rocky planet with the "
            "densest atmosphere of all the rocky bodies in the Solar System, and the "
            "only one with a mass and size that is close to that of its orbital neighbour Earth.",
        distanceFromSun: "108.2 million km",
        lengthOfDay: "243d 0h 0m",
        orbitalPeriod: "225 days",
        radius: "6,051.8 km",
        mass: "4.867 × 10^24 kg (0.815 M⊕)",
        gravity: "8.87 m/s²",
        surfaceArea: "460.2 million km²",
      ),
    ),
    PlanetModel(
      title: 'EARTH',
      subtitle: 'THE LIVING PLANET',
      imagePath: AppAssets.earthGlobe,
      shadowColor: AppColors.earthShadowColor,
      planetDetails: PlanetDetails(
        description: "While Earth is only the fifth largest planet in the solar system, "
            "it is the only world in our solar system with liquid water  “on the surface”. "
            "Just slightly larger than nearby Venus, Earth is the biggest of the four planets "
            "closest to the Sun, all of which are made of rock and metal.",
        distanceFromSun: "149.6 million km",
        lengthOfDay: "24h 0m",
        orbitalPeriod: "365.25 days",
        radius: "6,371 km",
        mass: "5.972 × 10^24 kg",
        gravity: "9.807 m/s²",
        surfaceArea: "510.1 million km²",
      ),
    ),
    PlanetModel(
      title: 'MARS',
      subtitle: 'THE LIVING PLANET',
      imagePath: AppAssets.marsGlobe,
      shadowColor: AppColors.marsShadowColor,
      planetDetails: PlanetDetails(
        description: "Venus is the second planet from the Sun. It is a rocky planet with the "
            "densest atmosphere of all the rocky bodies in the Solar System, and the "
            "only one with a mass and size that is close to that of its orbital neighbour Earth.",
        distanceFromSun: "227.9 million km",
        lengthOfDay: "1d 0h 37m",
        orbitalPeriod: "225 days",
        radius: "3,389.5 km",
        mass: "6.39 × 10^23 kg",
        gravity: "3.71 m/s²",
        surfaceArea: "144.4 million km²",
      ),
    ),
    PlanetModel(
      title: 'JUPITER',
      subtitle: 'THE RED PLANET',
      imagePath: AppAssets.jupiterGlobe,
      shadowColor: AppColors.jupiterShadowColor,
      planetDetails: PlanetDetails(
        description: "Jupiter is the fifth planet from the Sun and the largest "
            "in the Solar System. It is a gas giant with a mass more than two and a "
            "half times that of all the other planets in the Solar System combined, "
            "and slightly less than one one-thousandth the mass of the Sun.",
        distanceFromSun: "778.5 million km",
        lengthOfDay: "0d 9h 56m",
        orbitalPeriod: "4,330.6 days",
        radius: "69,911 km",
        mass: "1.898 × 10^27 kg",
        gravity: "24.79 m/s²",
        surfaceArea: "61.42 billion km²",
      ),
    ),
    PlanetModel(
      title: 'SATURN',
      subtitle: 'THE GIANT PLANET',
      imagePath: AppAssets.saturnGlobe,
      shadowColor: AppColors.saturnShadowColor,
      planetDetails: PlanetDetails(
        description: "Saturn is the sixth planet from the Sun and the second-largest "
            "in the Solar System, after Jupiter. It is a gas giant with an average radius "
            "of about nine-and-a-half times that of Earth. It has only one-eighth the "
            "average density of Earth, but is over 95 times more massive.",
        distanceFromSun: "1.434 billion km",
        lengthOfDay: "0d 10h 34m",
        orbitalPeriod: "225 days",
        radius: "58,232 km",
        mass: "5.683 × 10^26 kg",
        gravity: "10.44 m/s²",
        surfaceArea: "42.7 billion km²",
      ),
    ),
    PlanetModel(
      title: 'URANUS',
      subtitle: 'THE GIANT PLANET',
      imagePath: AppAssets.uranusGlobe,
      shadowColor: AppColors.uranusShadowColor,
      planetDetails: PlanetDetails(
        description: "Uranus is the seventh planet from the Sun. It is a gaseous "
            "cyan-coloured ice giant. Most of the planet is made of water, ammonia, "
            "and methane in a supercritical phase of matter, which in astronomy is "
            "called 'ice' or volatiles.",
        distanceFromSun: "2.9295 billion km",
        lengthOfDay: "0d 17h 14m",
        orbitalPeriod: "30,687 days",
        radius: "25,362 km",
        mass: "8.681 × 10^25 kg",
        gravity: "8.87 m/s²",
        surfaceArea: "8.083 billion km²",
      ),
    ),
    PlanetModel(
      title: 'NEPTUNE',
      subtitle: 'THE GIANT PLANET',
      imagePath: AppAssets.neptuneGlobe,
      shadowColor: AppColors.neptuneShadowColor,
      planetDetails: PlanetDetails(
        description: "Neptune is the eighth and farthest planet from the Sun. "
            "It is the fourth-largest planet in the Solar System by diameter, the "
            "third-most-massive planet, and the densest giant planet. It is 17 times "
            "the mass of Earth, and slightly more massive than its near-twin Uranus.",
        distanceFromSun: "4.495 billion km",
        lengthOfDay: "0d 16h 6m",
        orbitalPeriod: "60,190 days",
        radius: "24,622 km",
        mass: "1.024 × 10^26 kg",
        gravity: "11.15 m/s²",
        surfaceArea: "7.618 billion km²",
      ),
    ),
    PlanetModel(
      title: 'PLUTO',
      subtitle: 'THE GIANT PLANET',
      imagePath: AppAssets.plutoGlobe,
      shadowColor: AppColors.plutoShadowColor,
      planetDetails: PlanetDetails(
        description: "Pluto has a moderately eccentric and inclined orbit, ranging "
            "from 30 to 49 astronomical units (4.5 to 7.3 billion kilometers; 2.8 to 4.6 "
            "billion miles) from the Sun. Light from the Sun takes 5.5 hours to reach Pluto "
            "at its orbital distance of 39.5 AU (5.91 billion km; 3.67 billion mi). Pluto's "
            "eccentric orbit periodically brings it closer to the Sun than Neptune",
        distanceFromSun: "5.9 billion km",
        lengthOfDay: "6d 4h 0m",
        orbitalPeriod: "248 Earth years",
        radius: "1,188.3 km",
        mass: "1.30900 × 1022 kg ",
        gravity: "0.62 m/s²",
        surfaceArea: "1.67 x 10^7 square kilometers",
      ),
    ),
  ];
}
