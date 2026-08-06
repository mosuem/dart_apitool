import '../../model/model.dart';

/// represents a found FieldDeclaration
class TypeAliasDeclarationStorageV3 {
  final String name;
  final String aliasedTypeName;
  final bool isDeprecated;
  final bool isExperimental;
  final Set<String> entryPoints;
  final String relativePath;

  const TypeAliasDeclarationStorageV3({
    required this.name,
    required this.aliasedTypeName,
    required this.isDeprecated,
    required this.isExperimental,
    required this.entryPoints,
    required this.relativePath,
  });

  factory TypeAliasDeclarationStorageV3.fromJson(Map<String, dynamic> json) =>
      TypeAliasDeclarationStorageV3(
        name: json['name'] as String,
        aliasedTypeName: json['aliasedTypeName'] as String,
        isDeprecated: json['isDeprecated'] as bool,
        isExperimental: json['isExperimental'] as bool,
        entryPoints: (json['entryPoints'] as List<dynamic>)
            .map((e) => e as String)
            .toSet(),
        relativePath: json['relativePath'] as String,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'aliasedTypeName': aliasedTypeName,
        'isDeprecated': isDeprecated,
        'isExperimental': isExperimental,
        'entryPoints': entryPoints.toList(),
        'relativePath': relativePath,
      };

  static TypeAliasDeclarationStorageV3 fromTypeAliasDeclaration(
      TypeAliasDeclaration typeAliasDeclaration) {
    return TypeAliasDeclarationStorageV3(
      name: typeAliasDeclaration.name,
      aliasedTypeName: typeAliasDeclaration.aliasedTypeName,
      isDeprecated: typeAliasDeclaration.isDeprecated,
      isExperimental: typeAliasDeclaration.isExperimental,
      entryPoints: typeAliasDeclaration.entryPoints!,
      relativePath: typeAliasDeclaration.relativePath,
    );
  }
}

