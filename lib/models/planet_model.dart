import 'package:flutter/material.dart';

class PlanetModel {
  final String title;
  final String subtitle;
  final String imagePath;
  final Color shadowColor;
  final PlanetDetails? planetDetails;

  PlanetModel({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.shadowColor = Colors.black45,
    this.planetDetails,
  });
}

class PlanetDetails {
  final String description;
  final String distanceFromSun;
  final String lengthOfDay;
  final String orbitalPeriod;
  final String radius;
  final String mass;
  final String gravity;
  final String surfaceArea;

  PlanetDetails({
    this.description = "",
    this.distanceFromSun = "",
    this.lengthOfDay = "",
    this.orbitalPeriod = "",
    this.radius = "",
    this.mass = "",
    this.gravity = "",
    this.surfaceArea = "",
  });
}


// solar system planet details

//! The Sun (STAR)

// Size (diameter)	1,392,700km
// Mass : 1.989 x 1030kg (around 330,000 times that of Earth)
// Length of day	: 25 Earth days at the equator 
// Surface temperature :	5,500°C (9,932°F)
// Number of moons :	None
// Gravity compared to Earth	: Between 27 and 28 times stronger than the Earth
// planet shadow color : #C05415

//! 1. mercury

// Size : 3,457 km diameter
// Mass : 0.33010 x 1024 kg (around 5.5 per cent of Earth)
// Length of day	: 59 Earth days
// Surface temperature	: -180 °C (-290 °F) to 430 °C (800 °F) | Average 167 °C (333 °F)
// Number of moons :	None
// Gravity compared to Earth	: Around 38 per cent of Earth’s gravity (100 pounds on Earth would weigh 37.8 on Mercury)
// shadow color : #EAD1C4

//! 2. Venus

// Size : 12,104 km diameter
// Mass : 4.8673 x 1024 kg (around 81 per cent of Earth)
// Length of day	: about 117 Earth days
// Surface temperature	: Average 464 °C (867 °F
// Number of moons :	None
// Gravity compared to Earth	: Around 91 per cent of Earth’s gravity (100kg on Earth would weigh 90.7kg Venus)
// shadow color : #EAD1C4

//! 3. Earth

// Size : 12,756 km diameter
// Mass : 5.9722 x 1024 kg
// Length of day	: 24 hours
// Surface temperature	: Average is 15 °C (59 °F)
// Number of moons :	One
// shadow color : #EAD1C4

//! 4. Mars

// Size : 6,792 km diameter
// Mass : 0.64169 x 1024 kg (just over 10 per cent of Earth)
// Length of day	: Around 24.6 hours
// Surface temperature : Average -63 °C (-81.4 °F) | can be as high as 20 °C (70 °F) and as low as -153 °C (-225 °F)
// Number of moons :	Two (Phobos and Deimos)
// Gravity compared to Earth : Around 38 per cent of Earth’s Gravity (10kg on Earth would weigh around 38kg Mars)
// shadow color : #EAD1C4

//! 5. Jupiter

// Size : 142,984 km diameter
// Mass : 1,898.13 x 1024 kg (just under 318 times that of Earth’s)
// Length of day : 9.9 hours
// Surface temperature : -108 °C (-162.4 °F) average
// Number of moons :	79 (53 confirmed, 26 provisional)
// Gravity compared to Earth : About 2.64 times that of Earth’s (10kg on Earth would weigh around 264kg on Jupiter)
// shadow color : #EAD1C4

//! 6. Saturn

// Size : 120,536 km diameter
// Mass : 568.32 x 1024 kg (just over 95 times that of Earth’s)
// Length of day : 10.65 hours
// Surface temperature : At 1 bar: -139 °C (-218.2 °F) average
// Number of moons : 82 (53 confirmed, 29 provisional)
// Gravity compared to Earth : Around 1.16 times that of Earth’s (100kg on Earth would weigh about 106kg on Saturn)
// shadow color : #EAD1C4

//! 7. Uranus

// Size : 51,118 km diameter
// Mass : 86.811 x 1024 kg (around 14.54 times that of Earth’s)
// Length of day : 17.24 hours
// Surface temperature : -197 °C (-322.6 °F) average
// Number of moons : 27
// Gravity compared to Earth : Just under 92 per cent of Earth’s (100kg on Earth would weigh about 91.8kg on Uranus)
// shadow color : #EAD1C4

//! 8. Neptune

// Size : 49,528 km diameter
// Mass : 02.409 x 1024 kg (around 17.15 times that of Earth’s)
// Length of day : 16.11 hours
// Surface temperature : 	-201 °C (-329.8 °F) average
// Number of moons : 14
// Gravity compared to Earth : Around 1.15 times that of Earth’s (100kg on Earth would weigh about 115kg on Neptune)
// shadow color : #EAD1C4

//! 9. Neptune (dwarf planet)

// Size : 2,370 km diameter
// Mass : 0.01303 x 1024 kg (around 0.2 per cent of Earth) 02.409 x 1024 kg (around 17.15 times that of Earth’s)
// Length of day : About 153 hours (roughly 6.4 Earth days)
// Surface temperature : -226 to -240 ℃ (-375 to -400 ℉)
// Number of moons : Five (Charon, Nix, Hydra, Kerberos and Styx)
// Gravity compared to Earth : Around 1/15 compared to Earth (something weighing 100 pounds on Earth would weigh about seven on Pluto)
// shadow color : #EAD1C4

