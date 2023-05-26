// To parse this JSON data, do
//
//     final rocketDetails = rocketDetailsFromJson(jsonString);

import 'dart:convert';

RocketDetails rocketDetailsFromJson(String str) => RocketDetails.fromJson(json.decode(str));

String rocketDetailsToJson(RocketDetails data) => json.encode(data.toJson());

class RocketDetails {
  Diameter height;
  Diameter diameter;
  // Mass mass;
  // FirstStage firstStage;
  // SecondStage secondStage;
  // Engines engines;
  // LandingLegs landingLegs;
  // List<PayloadWeight> payloadWeights;
  List<String> flickrImages;
  // String name;
  // String type;
  bool active;
  // int stages;
  // int boosters;
  int costPerLaunch;
  int successRatePct;
  // DateTime firstFlight;
  // String country;
  // String company;
  String wikipedia;
  String description;
  String id;

  RocketDetails({
    required this.height,
    required this.diameter,
    // required this.mass,
    // required this.firstStage,
    // required this.secondStage,
    // required this.engines,
    // required this.landingLegs,
    // required this.payloadWeights,
    required this.flickrImages,
    // required this.name,
    // required this.type,
    required this.active,
    // required this.stages,
    // required this.boosters,
    required this.costPerLaunch,
    required this.successRatePct,
    // required this.firstFlight,
    // required this.country,
    // required this.company,
    required this.wikipedia,
    required this.description,
    required this.id,
  });

  factory RocketDetails.fromJson(Map<String, dynamic> json) => RocketDetails(
    height: Diameter.fromJson(json["height"]),
    diameter: Diameter.fromJson(json["diameter"]),
    // mass: Mass.fromJson(json["mass"]),
    // firstStage: FirstStage.fromJson(json["first_stage"]),
    // secondStage: SecondStage.fromJson(json["second_stage"]),
    // engines: Engines.fromJson(json["engines"]),
    // landingLegs: LandingLegs.fromJson(json["landing_legs"]),
    // payloadWeights: List<PayloadWeight>.from(json["payload_weights"].map((x) => PayloadWeight.fromJson(x))),
    flickrImages: List<String>.from(json["flickr_images"].map((x) => x)),
    // name: json["name"],
    // type: json["type"],
    active: json["active"],
    // stages: json["stages"],
    // boosters: json["boosters"],
    costPerLaunch: json["cost_per_launch"],
    successRatePct: json["success_rate_pct"],
    // firstFlight: DateTime.parse(json["first_flight"]),
    // country: json["country"],
    // company: json["company"],
    wikipedia: json["wikipedia"],
    description: json["description"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "height": height.toJson(),
    "diameter": diameter.toJson(),
    "flickr_images": List<dynamic>.from(flickrImages.map((x) => x)),
    "active": active,
    "cost_per_launch": costPerLaunch,
    "success_rate_pct": successRatePct,
    "wikipedia": wikipedia,
    "description": description,
    "id": id,
  };
}

class Diameter {
  double meters;
  double feet;

  Diameter({
    required this.meters,
    required this.feet,
  });

  factory Diameter.fromJson(Map<String, dynamic> json) => Diameter(
    meters: json["meters"]?.toDouble(),
    feet: json["feet"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "meters": meters,
    "feet": feet,
  };
}


