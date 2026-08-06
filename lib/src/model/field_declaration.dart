import 'declaration.dart';

/// represents a found FieldDeclaration
class FieldDeclaration implements Declaration {
  /// the signature of this field declaration.
  ///
  /// Contains the type (including type parameters and nullability) as well as the name of this field
  String get signature => _computeSignature();

  /// type of this field
  final String typeName;

  /// full library name for the type
  final String? typeFullLibraryName;

  /// name of this field
  @override
  final String name;

  /// whether this field is deprecated
  @override
  final bool isDeprecated;

  /// whether this field is static
  final bool isStatic;

  /// whether this field is a constant
  final bool isConst;

  /// whether this field is experimental
  @override
  final bool isExperimental;

  /// entry points this field is reachable through
  @override
  final Set<String>? entryPoints;

  /// the relative path of the library
  @override
  final String relativePath;

  /// whether this field is readable
  final bool isReadable;

  /// whether this field is writeable
  final bool isWriteable;

  const FieldDeclaration({
    required this.typeName,
    required this.typeFullLibraryName,
    required this.name,
    required this.isDeprecated,
    required this.isStatic,
    required this.isConst,
    required this.isExperimental,
    this.entryPoints,
    required this.relativePath,
    required this.isReadable,
    required this.isWriteable,
  });

  FieldDeclaration copyWith({
    String? typeName,
    String? typeFullLibraryName,
    String? name,
    bool? isDeprecated,
    bool? isStatic,
    bool? isConst,
    bool? isExperimental,
    Set<String>? entryPoints,
    String? relativePath,
    bool? isReadable,
    bool? isWriteable,
  }) {
    return FieldDeclaration(
      typeName: typeName ?? this.typeName,
      typeFullLibraryName: typeFullLibraryName ?? this.typeFullLibraryName,
      name: name ?? this.name,
      isDeprecated: isDeprecated ?? this.isDeprecated,
      isStatic: isStatic ?? this.isStatic,
      isConst: isConst ?? this.isConst,
      isExperimental: isExperimental ?? this.isExperimental,
      entryPoints: entryPoints ?? this.entryPoints,
      relativePath: relativePath ?? this.relativePath,
      isReadable: isReadable ?? this.isReadable,
      isWriteable: isWriteable ?? this.isWriteable,
    );
  }

  /// helper to compute the signature of a field
  String _computeSignature() {
    return '$typeName $name';
  }

  @override
  String toString() =>
      'FieldDeclaration(typeName: $typeName, name: $name, isDeprecated: $isDeprecated, isStatic: $isStatic, isConst: $isConst, isExperimental: $isExperimental, entryPoints: $entryPoints, relativePath: $relativePath, isReadable: $isReadable, isWriteable: $isWriteable)';
}



