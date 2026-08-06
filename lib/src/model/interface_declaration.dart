import '../utils/string_utils.dart';
import 'declaration.dart';
import 'executable_declaration.dart';
import 'field_declaration.dart';
import 'type_usage.dart';
import 'type_usage_kind.dart';

/// Represents a found interface declaration
class InterfaceDeclaration implements Declaration {
  /// the signature of this interface condensed to one String
  /// contains Type arguments as well as base types or implemented interfaces
  String get signature => _computeSignature();

  /// name of this interface
  @override
  final String name;

  /// whether this interface is deprecated
  @override
  final bool isDeprecated;

  /// whether this interface is experimental
  @override
  final bool isExperimental;

  /// determines if this declaration is sealed
  final bool isSealed;

  /// determines if this declaration is abstract
  final bool isAbstract;

  /// usages of this interface
  final Set<TypeUsage> typeUsages;

  /// list of type parameter names
  final List<String> typeParameterNames;

  /// set of super type names
  final Set<String> superTypeNames;

  /// executables that belong to this interface
  final List<ExecutableDeclaration> executableDeclarations;

  /// fields that belong to this interface
  final List<FieldDeclaration> fieldDeclarations;

  /// entry points this interface is reachable through
  @override
  final Set<String>? entryPoints;

  /// the relative path of the library
  @override
  final String relativePath;

  const InterfaceDeclaration({
    required this.name,
    required this.isDeprecated,
    required this.isExperimental,
    required this.isSealed,
    required this.isAbstract,
    required this.typeUsages,
    required this.typeParameterNames,
    required this.superTypeNames,
    required this.executableDeclarations,
    required this.fieldDeclarations,
    this.entryPoints,
    required this.relativePath,
  });

  InterfaceDeclaration copyWith({
    String? name,
    bool? isDeprecated,
    bool? isExperimental,
    bool? isSealed,
    bool? isAbstract,
    Set<TypeUsage>? typeUsages,
    List<String>? typeParameterNames,
    Set<String>? superTypeNames,
    List<ExecutableDeclaration>? executableDeclarations,
    List<FieldDeclaration>? fieldDeclarations,
    Set<String>? entryPoints,
    String? relativePath,
  }) {
    return InterfaceDeclaration(
      name: name ?? this.name,
      isDeprecated: isDeprecated ?? this.isDeprecated,
      isExperimental: isExperimental ?? this.isExperimental,
      isSealed: isSealed ?? this.isSealed,
      isAbstract: isAbstract ?? this.isAbstract,
      typeUsages: typeUsages ?? this.typeUsages,
      typeParameterNames: typeParameterNames ?? this.typeParameterNames,
      superTypeNames: superTypeNames ?? this.superTypeNames,
      executableDeclarations:
          executableDeclarations ?? this.executableDeclarations,
      fieldDeclarations: fieldDeclarations ?? this.fieldDeclarations,
      entryPoints: entryPoints ?? this.entryPoints,
      relativePath: relativePath ?? this.relativePath,
    );
  }


  String _computeSignature() {
    String superTypeSuffix = '';
    if (superTypeNames.isNotEmpty) {
      superTypeSuffix = ' : ${superTypeNames.join(', ')}';
    }
    final typeParameterSuffix = getTypeParameterSuffix(typeParameterNames);
    return '$name$typeParameterSuffix$superTypeSuffix';
  }

  /// determines if this interface is required (meaning: can be used in a type hierarchy by the consumer)
  bool get isRequired =>
      isAbstract &&
      !isSealed &&
      typeUsages.any((tu) => tu.kind == TypeUsageKind.input);

  @override
  String toString() =>
      'InterfaceDeclaration(name: $name, isDeprecated: $isDeprecated, isExperimental: $isExperimental, isSealed: $isSealed, isAbstract: $isAbstract, typeUsages: $typeUsages, typeParameterNames: $typeParameterNames, superTypeNames: $superTypeNames, executableDeclarations: $executableDeclarations, fieldDeclarations: $fieldDeclarations, entryPoints: $entryPoints, relativePath: $relativePath)';
}


