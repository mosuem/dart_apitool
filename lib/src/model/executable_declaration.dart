import '../utils/utils.dart';
import 'declaration.dart';

/// Represents the type of executable found
enum ExecutableType {
  /// method declaration
  method,
  // constructor declaration
  constructor,
}

/// Represents an executable parameter declaration
class ExecutableParameterDeclaration implements Declaration {
  /// whether the parameter is required
  final bool isRequired;

  /// whether the parameter is named
  final bool isNamed;

  /// the name of the parameter
  @override
  final String name;

  /// whether the parameter is deprecated
  @override
  final bool isDeprecated;

  /// whether the parameter is experimental
  @override
  final bool isExperimental;

  /// type name of this parameter
  final String typeName;

  /// the type library path
  final String? typeFullLibraryName;

  /// the relative path of the library
  @override
  final String relativePath;

  const ExecutableParameterDeclaration({
    required this.isRequired,
    required this.isNamed,
    required this.name,
    required this.isDeprecated,
    required this.isExperimental,
    required this.typeName,
    required this.typeFullLibraryName,
    required this.relativePath,
  });

  ExecutableParameterDeclaration copyWith({
    bool? isRequired,
    bool? isNamed,
    String? name,
    bool? isDeprecated,
    bool? isExperimental,
    String? typeName,
    String? typeFullLibraryName,
    String? relativePath,
  }) {
    return ExecutableParameterDeclaration(
      isRequired: isRequired ?? this.isRequired,
      isNamed: isNamed ?? this.isNamed,
      name: name ?? this.name,
      isDeprecated: isDeprecated ?? this.isDeprecated,
      isExperimental: isExperimental ?? this.isExperimental,
      typeName: typeName ?? this.typeName,
      typeFullLibraryName: typeFullLibraryName ?? this.typeFullLibraryName,
      relativePath: relativePath ?? this.relativePath,
    );
  }

  /// [ExecutableParameterDeclaration]s can't have entry points
  @override
  Set<String>? get entryPoints => null;

  @override
  String toString() =>
      'ExecutableParameterDeclaration(isRequired: $isRequired, isNamed: $isNamed, name: $name, isDeprecated: $isDeprecated, isExperimental: $isExperimental, typeName: $typeName, typeFullLibraryName: $typeFullLibraryName, relativePath: $relativePath)';
}


/// Represents an executable declaration
class ExecutableDeclaration implements Declaration {
  /// signature of the executable declaration.
  ///
  /// Contains the return type, name of the executable as well as all its parameters
  String get signature => _computeSignature();

  /// name of the return type
  final String returnTypeName;

  // full library name of the return type
  final String? returnTypeFullLibraryName;

  /// name of the executable
  @override
  final String name;

  /// whether the executable is deprecated
  @override
  final bool isDeprecated;

  /// whether the executable is experimental
  @override
  final bool isExperimental;

  /// list of the executables parameters ([ExecutableParameterDeclaration]s)
  final List<ExecutableParameterDeclaration> parameters;

  /// type parameter names of this executable
  final List<String> typeParameterNames;

  /// type of the executable
  final ExecutableType type;

  /// whether the executable is a static method
  final bool isStatic;

  /// entry points for this executable
  @override
  final Set<String>? entryPoints;

  /// the relative path of the library
  @override
  final String relativePath;

  const ExecutableDeclaration({
    required this.returnTypeName,
    required this.returnTypeFullLibraryName,
    required this.name,
    required this.isDeprecated,
    required this.isExperimental,
    required this.parameters,
    required this.typeParameterNames,
    required this.type,
    required this.isStatic,
    this.entryPoints,
    required this.relativePath,
  });

  ExecutableDeclaration copyWith({
    String? returnTypeName,
    String? returnTypeFullLibraryName,
    String? name,
    bool? isDeprecated,
    bool? isExperimental,
    List<ExecutableParameterDeclaration>? parameters,
    List<String>? typeParameterNames,
    ExecutableType? type,
    bool? isStatic,
    Set<String>? entryPoints,
    String? relativePath,
  }) {
    return ExecutableDeclaration(
      returnTypeName: returnTypeName ?? this.returnTypeName,
      returnTypeFullLibraryName:
          returnTypeFullLibraryName ?? this.returnTypeFullLibraryName,
      name: name ?? this.name,
      isDeprecated: isDeprecated ?? this.isDeprecated,
      isExperimental: isExperimental ?? this.isExperimental,
      parameters: parameters ?? this.parameters,
      typeParameterNames: typeParameterNames ?? this.typeParameterNames,
      type: type ?? this.type,
      isStatic: isStatic ?? this.isStatic,
      entryPoints: entryPoints ?? this.entryPoints,
      relativePath: relativePath ?? this.relativePath,
    );
  }

  /// computes the executable signature.
  ///
  /// The signature contains all public facing aspects of the executable like return value, name and parameters
  String _computeSignature() {
    List<String> parameterStrings = [];
    List<String> namedParameterStrings = [];
    for (final parameter in parameters) {
      final paramTypeString = parameter.typeName;
      final paramName = parameter.name;
      if (!parameter.isNamed) {
        parameterStrings.add('$paramTypeString $paramName');
      } else {
        String requiredPrefix = '';
        if (parameter.isRequired) {
          requiredPrefix = 'required ';
          namedParameterStrings
              .add('$requiredPrefix$paramTypeString $paramName');
        }
      }
    }
    if (namedParameterStrings.isNotEmpty) {
      parameterStrings.add('{${namedParameterStrings.join(', ')}}');
    }
    String typeParameterSuffix = getTypeParameterSuffix(typeParameterNames);
    return '$returnTypeName $name$typeParameterSuffix(${parameterStrings.join(', ')})';
  }

  @override
  String toString() =>
      'ExecutableDeclaration(returnTypeName: $returnTypeName, returnTypeFullLibraryName: $returnTypeFullLibraryName, name: $name, isDeprecated: $isDeprecated, isExperimental: $isExperimental, parameters: $parameters, typeParameterNames: $typeParameterNames, type: $type, isStatic: $isStatic, entryPoints: $entryPoints, relativePath: $relativePath)';
}



