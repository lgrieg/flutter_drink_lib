class Cocktail {
  final String id;
  final String name;
  final String imageUrl;
  

  Cocktail({
    required this.name,
    required this.imageUrl,
    required this.id,
  });

  factory Cocktail.fromMap(Map<String, dynamic> map) {
    return Cocktail(
      id: map['idDrink'],
      name: map['strDrink'],
      imageUrl: map['strDrinkThumb'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idDrink': id,
      'strDrink': name,
      'strDrinkThumb': imageUrl,
    };
  }
}
