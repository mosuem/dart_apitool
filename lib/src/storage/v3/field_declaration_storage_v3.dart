import '../../model/model.dart';

/// represents a found FieldDeclaration
class FieldDeclarationStorageV3 {
  final String typeName;
  final String name;
  final bool isDeprecated;
  final bool isExperimental;
  final bool isStatic;
  final Set<String> entryPoints;
  final String relativePath;
  final bool isReadable;
  final bool isWriteable;

  const FieldDeclarationStorageV3({
    required this.typeName,
    required this.name,
    required this.isDeprecated,
    required this.isExperimental,
    required this.isStatic,
    required this.entryPoints,
    required this.relativePath,
    required this.isReadable,
    required this.isWriteable,
  });

  factory FieldDeclarationStorageV3.fromJson(Map<String, Object?> json) =>
      FieldDeclarationStorageV3(
        typeName: json['typeName'] as String,
        name: json['name'] as String,
        isDeprecated: json['isDeprecated'] as bool,
        isExperimental: json['isExperimental'] as bool,
        isStatic: json['isStatic'] as bool,
        entryPoints: (json['entryPoints'] as List<dynamic>)
            .map((e) => e as String)
            .toSet(),
        relativePath: json['relativePath'] as String,
        isReadable: json['isReadable'] as bool,
        isWriteable: json['isWriteable'] as bool,
      );

  Map<String, dynamic> toJson() => {
        'typeName': typeName,
        'name': name,
        'isDeprecated': isDeprecated,
        'isExperimental': isExperimental,
        'isStatic': isStatic,
        'entryPoints': entryPoints.toList(),
        'relativePath': relativePath,
        'isReadable': isReadable,
        'isWriteable': isWriteable,
      };

  static FieldDeclarationStorageV3 fromFieldDeclaration(
      FieldDeclaration fieldDeclaration) {
    return FieldDeclarationStorageV3(
      typeName: fieldDeclaration.typeName,
      name: fieldDeclaration.name,
      isDeprecated: fieldDeclaration.isDeprecated,
      isExperimental: fieldDeclaration.isExperimental,
      isStatic: fieldDeclaration.isStatic,
      entryPoints: fieldDeclaration.entryPoints!,
      relativePath: fieldDeclaration.relativePath,
      isReadable: fieldDeclaration.isReadable,
      isWriteable: fieldDeclaration.isWriteable,
    );
  }
}

