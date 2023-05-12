class Cocktail {
  final String id;
  final String name;
  final String imageUrl;
  final List<String> ingredients;

  Cocktail(
    this.id,
    this.name,
    this.imageUrl,
    this.ingredients,
  );

  Cocktail.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        imageUrl = json['imageUrl'],
        ingredients = List<String>.from(json['ingredients']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'ingredients': ingredients,
    };
  }

  @override
  String toString() {
    return ' Name :  $name \n\n   Ingredients :  $ingredients \n';
  }
}
