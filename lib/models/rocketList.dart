class Rocket {
  final String id;
  final String name;
  final String rocketImage;
  final int enginesCount;
  final String country;


  Rocket(
      {
    required this.id,
    required this.name,
    required this.rocketImage,
    required this.enginesCount,
    required this.country,
  });

  factory Rocket.fromJson(Map<String, dynamic> json) {
    return Rocket(
      country: json['country'],
      id: json['id'],
      name: json['name'],
      rocketImage: json['flickr_images'][1],
      enginesCount: json['engines']['number'],
    );
  }
}