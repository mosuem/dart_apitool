import '../../model/model.dart';

/// Represents the type of executable found
enum ExecutableTypeStorageV3 {
  /// method declaration
  method,
  // constructor declaration
  constructor;

  ExecutableType toExecutableType() {
    switch (this) {
      case method:
        return ExecutableType.method;
      case constructor:
        return ExecutableType.constructor;
    }
  }

  static ExecutableTypeStorageV3 fromExecutableType(
      ExecutableType executableType) {
    switch (executableType) {
      case ExecutableType.method:
        return method;
      case ExecutableType.constructor:
        return constructor;
    }
  }
}

class ExecutableParameterDeclarationStorageV3 {
  final bool isRequired;
  final bool isNamed;
  final String name;
  final bool isDeprecated;
  final bool isExperimental;
  final String typeName;
  final String relativePath;

  const ExecutableParameterDeclarationStorageV3({
    required this.isRequired,
    required this.isNamed,
    required this.name,
    required this.isDeprecated,
    required this.isExperimental,
    required this.typeName,
    required this.relativePath,
  });

  factory ExecutableParameterDeclarationStorageV3.fromJson(
          Map<String, Object?> json) =>
      ExecutableParameterDeclarationStorageV3(
        isRequired: json['isRequired'] as bool,
        isNamed: json['isNamed'] as bool,
        name: json['name'] as String,
        isDeprecated: json['isDeprecated'] as bool,
        isExperimental: json['isExperimental'] as bool,
        typeName: json['typeName'] as String,
        relativePath: json['relativePath'] as String,
      );

  Map<String, dynamic> toJson() => {
        'isRequired': isRequired,
        'isNamed': isNamed,
        'name': name,
        'isDeprecated': isDeprecated,
        'isExperimental': isExperimental,
        'typeName': typeName,
        'relativePath': relativePath,
      };

  static ExecutableParameterDeclarationStorageV3
      fromExecutableParameterDeclaration(
          ExecutableParameterDeclaration executableParameterDeclaration) {
    return ExecutableParameterDeclarationStorageV3(
      isRequired: executableParameterDeclaration.isRequired,
      isNamed: executableParameterDeclaration.isNamed,
      name: executableParameterDeclaration.name,
      isDeprecated: executableParameterDeclaration.isDeprecated,
      isExperimental: executableParameterDeclaration.isExperimental,
      typeName: executableParameterDeclaration.typeName,
      relativePath: executableParameterDeclaration.relativePath,
    );
  }
}

/// Represents an executable declaration
class ExecutableDeclarationStorageV3 {
  final String returnTypeName;
  final String name;
  final bool isDeprecated;
  final bool isExperimental;
  final List<ExecutableParameterDeclarationStorageV3> parameters;
  final List<String> typeParameterNames;
  final ExecutableTypeStorageV3 type;
  final bool isStatic;
  final Set<String> entryPoints;
  final String relativePath;

  const ExecutableDeclarationStorageV3({
    required this.returnTypeName,
    required this.name,
    required this.isDeprecated,
    required this.isExperimental,
    required this.parameters,
    required this.typeParameterNames,
    required this.type,
    required this.isStatic,
    required this.entryPoints,
    required this.relativePath,
  });

  factory ExecutableDeclarationStorageV3.fromJson(Map<String, Object?> json) =>
      ExecutableDeclarationStorageV3(
        returnTypeName: json['returnTypeName'] as String,
        name: json['name'] as String,
        isDeprecated: json['isDeprecated'] as bool,
        isExperimental: json['isExperimental'] as bool,
        parameters: (json['parameters'] as List<dynamic>)
            .map((e) => ExecutableParameterDeclarationStorageV3.fromJson(
                e as Map<String, dynamic>))
            .toList(),
        typeParameterNames: (json['typeParameterNames'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        type: ExecutableTypeStorageV3.values.byName(json['type'] as String),
        isStatic: json['isStatic'] as bool,
        entryPoints: (json['entryPoints'] as List<dynamic>)
            .map((e) => e as String)
            .toSet(),
        relativePath: json['relativePath'] as String,
      );

  Map<String, dynamic> toJson() => {
        'returnTypeName': returnTypeName,
        'name': name,
        'isDeprecated': isDeprecated,
        'isExperimental': isExperimental,
        'parameters': parameters.map((e) => e.toJson()).toList(),
        'typeParameterNames': typeParameterNames,
        'type': type.name,
        'isStatic': isStatic,
        'entryPoints': entryPoints.toList(),
        'relativePath': relativePath,
      };

  static ExecutableDeclarationStorageV3 fromExecutableDeclaration(
      ExecutableDeclaration executableDeclaration) {
    return ExecutableDeclarationStorageV3(
      returnTypeName: executableDeclaration.returnTypeName,
      name: executableDeclaration.name,
      isDeprecated: executableDeclaration.isDeprecated,
      isExperimental: executableDeclaration.isExperimental,
      parameters: executableDeclaration.parameters
          .map((p) => ExecutableParameterDeclarationStorageV3
              .fromExecutableParameterDeclaration(p))
          .toList(),
      typeParameterNames: executableDeclaration.typeParameterNames,
      type: ExecutableTypeStorageV3.fromExecutableType(
          executableDeclaration.type),
      isStatic: executableDeclaration.isStatic,
      entryPoints: executableDeclaration.entryPoints!,
      relativePath: executableDeclaration.relativePath,
    );
  }
}

