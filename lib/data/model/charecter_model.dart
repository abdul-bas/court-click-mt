class CharacterModel {
  final int id;
  final String name;
  final String character;
  final String? profilePath;

  CharacterModel({
    required this.id,
    required this.name,
    required this.character,
    this.profilePath,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      character: json['character'] ?? '',
      profilePath: json['profile_path'],
    );
  }
}