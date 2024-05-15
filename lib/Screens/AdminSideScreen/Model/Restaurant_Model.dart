
class Restaurant {
  final String name;
  final String cuisine;
  final String location;
  final String description;
  final String imageURL;
  final String openingTime;
  final String closingTime;

  Restaurant( {
    required this.name,
    required this.cuisine,
    required this.location,
    required this.description,
    required this.imageURL,
    required this.openingTime,
    required this.closingTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cuisine': cuisine,
      'location': location,
      'description': description,
      'imageURL': imageURL,
      'openingTime': openingTime,
      'closingTime': closingTime,
    };
  }


}
