import 'declaration.dart';

/// represents a found TypeAliasDeclaration
class TypeAliasDeclaration implements Declaration {
  /// the signature of this type alias declaration.
  ///
  /// Contains the type (including type parameters and nullability) as well as the name of this field
  String get signature => _computeSignature();

  /// name of this type alias
  @override
  final String name;

  /// name of the aliased type
  final String aliasedTypeName;

  /// whether this type alias is deprecated
  @override
  final bool isDeprecated;

  /// whether this type alias is experimental
  @override
  final bool isExperimental;

  /// entry points this type alias is reachable through
  @override
  final Set<String>? entryPoints;

  /// the relative path of the library
  @override
  final String relativePath;

  const TypeAliasDeclaration({
    required this.name,
    required this.aliasedTypeName,
    required this.isDeprecated,
    required this.isExperimental,
    this.entryPoints,
    required this.relativePath,
  });

  TypeAliasDeclaration copyWith({
    String? name,
    String? aliasedTypeName,
    bool? isDeprecated,
    bool? isExperimental,
    Set<String>? entryPoints,
    String? relativePath,
  }) {
    return TypeAliasDeclaration(
      name: name ?? this.name,
      aliasedTypeName: aliasedTypeName ?? this.aliasedTypeName,
      isDeprecated: isDeprecated ?? this.isDeprecated,
      isExperimental: isExperimental ?? this.isExperimental,
      entryPoints: entryPoints ?? this.entryPoints,
      relativePath: relativePath ?? this.relativePath,
    );
  }

  /// helper to compute the signature of a field
  String _computeSignature() {
    return '$name = $aliasedTypeName';
  }

  @override
  String toString() =>
      'TypeAliasDeclaration(name: $name, aliasedTypeName: $aliasedTypeName, isDeprecated: $isDeprecated, isExperimental: $isExperimental, entryPoints: $entryPoints, relativePath: $relativePath)';
}



