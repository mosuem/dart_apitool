import '../../model/model.dart';
import 'executable_declaration_storage_v3.dart';
import 'field_declaration_storage_v3.dart';

/// Represents a found class declaration
class InterfaceDeclarationStorageV3 {
  final String name;
  final bool isDeprecated;
  final bool isExperimental;
  final bool isSealed;
  final bool isRequired;
  final List<String> typeParameterNames;
  final List<String> superTypeNames;
  final List<ExecutableDeclarationStorageV3> executableDeclarations;
  final List<FieldDeclarationStorageV3> fieldDeclarations;
  final Set<String> entryPoints;
  final String relativePath;

  const InterfaceDeclarationStorageV3({
    required this.name,
    required this.isDeprecated,
    required this.isExperimental,
    required this.isSealed,
    required this.isRequired,
    required this.typeParameterNames,
    required this.superTypeNames,
    required this.executableDeclarations,
    required this.fieldDeclarations,
    required this.entryPoints,
    required this.relativePath,
  });

  factory InterfaceDeclarationStorageV3.fromJson(Map<String, Object?> json) =>
      InterfaceDeclarationStorageV3(
        name: json['name'] as String,
        isDeprecated: json['isDeprecated'] as bool,
        isExperimental: json['isExperimental'] as bool,
        isSealed: json['isSealed'] as bool,
        isRequired: json['isRequired'] as bool,
        typeParameterNames: (json['typeParameterNames'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        superTypeNames: (json['superTypeNames'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        executableDeclarations: (json['executableDeclarations'] as List<dynamic>)
            .map((e) => ExecutableDeclarationStorageV3.fromJson(
                e as Map<String, dynamic>))
            .toList(),
        fieldDeclarations: (json['fieldDeclarations'] as List<dynamic>)
            .map((e) =>
                FieldDeclarationStorageV3.fromJson(e as Map<String, dynamic>))
            .toList(),
        entryPoints: (json['entryPoints'] as List<dynamic>)
            .map((e) => e as String)
            .toSet(),
        relativePath: json['relativePath'] as String,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'isDeprecated': isDeprecated,
        'isExperimental': isExperimental,
        'isSealed': isSealed,
        'isRequired': isRequired,
        'typeParameterNames': typeParameterNames,
        'superTypeNames': superTypeNames,
        'executableDeclarations':
            executableDeclarations.map((e) => e.toJson()).toList(),
        'fieldDeclarations': fieldDeclarations.map((e) => e.toJson()).toList(),
        'entryPoints': entryPoints.toList(),
        'relativePath': relativePath,
      };

  static InterfaceDeclarationStorageV3 fromInterfaceDeclaration(
      InterfaceDeclaration interfaceDeclaration) {
    return InterfaceDeclarationStorageV3(
      name: interfaceDeclaration.name,
      isDeprecated: interfaceDeclaration.isDeprecated,
      isExperimental: interfaceDeclaration.isExperimental,
      isSealed: interfaceDeclaration.isSealed,
      isRequired: interfaceDeclaration.isRequired,
      typeParameterNames: interfaceDeclaration.typeParameterNames,
      superTypeNames: interfaceDeclaration.superTypeNames.toList(),
      executableDeclarations: interfaceDeclaration.executableDeclarations
          .map((e) =>
              ExecutableDeclarationStorageV3.fromExecutableDeclaration(e))
          .toList(),
      fieldDeclarations: interfaceDeclaration.fieldDeclarations
          .map((f) => FieldDeclarationStorageV3.fromFieldDeclaration(f))
          .toList(),
      entryPoints: interfaceDeclaration.entryPoints!,
      relativePath: interfaceDeclaration.relativePath,
    );
  }
}

