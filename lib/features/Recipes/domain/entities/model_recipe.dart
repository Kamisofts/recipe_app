class ModelRecipe {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  Map<String, num>? nutrition;
  List<String>? ingredients;
  List<String>? steps;

  ModelRecipe(
      {/*required*/ this.name,
      /*required*/ this.description,
      /*required*/ this.imageUrl,
      /*required*/ this.nutrition,
      /*required*/ this.ingredients,
      /*required*/ this.steps,
      /*required*/ this.id});

  ModelRecipe.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    nutrition = Map<String, num>.from(json['nutrition'] as Map);
    ingredients =
        (json['ingredients'] as List<dynamic>).map((e) => e as String).toList();
    steps = (json['steps'] as List<dynamic>).map((e) => e as String).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    data['description'] = description;
    data['name'] = name;
    data['ingredients'] = ingredients;
    data['steps'] = steps;
    data['nutrition'] = nutrition;

    return data;
  }

  ModelRecipe copyWith({
    String? name,
    String? description,
    String? imageUrl,
    Map<String, num>? nutrition,
    List<String>? ingredients,
    List<String>? steps,
    String? id,
  }) {
    return ModelRecipe(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
      nutrition: nutrition ?? this.nutrition,
      steps: steps ?? this.steps,
    );
  }
}
