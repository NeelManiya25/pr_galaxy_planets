class decode {
  String position;
  String name;
  String radius;
  String orbital_period;
  String gravity;
  String distance;
  String description;
  String image;

  decode({
    required this.position,
    required this.name,
    required this.radius,
    required this.orbital_period,
    required this.gravity,
    required this.distance,
    required this.description,
    required this.image,
  });

  factory decode.map({required Map data}) {
    return decode(
      position: data['position'],
      name: data['name'],
      radius: data['radius'],
      orbital_period: data['orbital_period'],
      gravity: data['gravity'],
      distance: data['distance'],
      description: data['description'],
      image: data['image'],
    );
  }
}
