class Info {
  final String id;
  final String name;
  final String imageUrl;
  final String instruction;
  

  Info({
    required this.name,
    required this.imageUrl,
    required this.id,
    required this.instruction,
  });

  factory Info.fromMap(Map<String, dynamic> map) {
    return Info(
      id: map['idDrink'],
      name: map['strDrink'],
      imageUrl: map['strDrinkThumb'],
      instruction: map['strInstructions'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idDrink': id,
      'strDrink': name,
      'strDrinkThumb': imageUrl,
      'strInstructions': instruction,
    };
  }
}
