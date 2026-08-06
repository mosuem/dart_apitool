import 'package:pub_semver/pub_semver.dart';

import 'declaration.dart';
import 'executable_declaration.dart';
import 'field_declaration.dart';
import 'interface_declaration.dart';
import 'package_api_semantics.dart';
import 'package_dependency.dart';
import 'platform_constraints.dart';
import 'sdk_type.dart';
import 'type_alias_declaration.dart';
import 'type_hierarchy.dart';

/// represents the model of a public package API.
class PackageApi {
  /// name of the package
  final String packageName;

  /// version of the package
  final String? packageVersion;

  /// path to the package
  final String packagePath;

  /// interface declarations this package has
  final List<InterfaceDeclaration> interfaceDeclarations;

  /// root level executable declarations this package has
  final List<ExecutableDeclaration> executableDeclarations;

  /// root level field declarations this package has
  final List<FieldDeclaration> fieldDeclarations;

  /// type alias declarations this package has
  final List<TypeAliasDeclaration> typeAliasDeclarations;

  /// the semantics of this model. This indicates if this model is compatible (e.g. for diffing) with another model
  final Set<PackageApiSemantics> semantics;

  /// used Android platform constraints
  final AndroidPlatformConstraints? androidPlatformConstraints;

  /// used iOS platform constraints
  final IOSPlatformConstraints? iosPlatformConstraints;

  /// type of sdk needed
  final SdkType sdkType;

  /// package dependencies
  final List<PackageDependency> packageDependencies;

  /// minimum sdk version
  final Version minSdkVersion;

  /// the type hierarchy of the public API
  final TypeHierarchy typeHierarchy;

  const PackageApi({
    required this.packageName,
    required this.packageVersion,
    required this.packagePath,
    required this.interfaceDeclarations,
    required this.executableDeclarations,
    required this.fieldDeclarations,
    required this.typeAliasDeclarations,
    this.semantics = const <PackageApiSemantics>{},
    this.androidPlatformConstraints,
    this.iosPlatformConstraints,
    required this.sdkType,
    required this.packageDependencies,
    required this.minSdkVersion,
    required this.typeHierarchy,
  });

  PackageApi copyWith({
    String? packageName,
    String? packageVersion,
    String? packagePath,
    List<InterfaceDeclaration>? interfaceDeclarations,
    List<ExecutableDeclaration>? executableDeclarations,
    List<FieldDeclaration>? fieldDeclarations,
    List<TypeAliasDeclaration>? typeAliasDeclarations,
    Set<PackageApiSemantics>? semantics,
    AndroidPlatformConstraints? androidPlatformConstraints,
    IOSPlatformConstraints? iosPlatformConstraints,
    SdkType? sdkType,
    List<PackageDependency>? packageDependencies,
    Version? minSdkVersion,
    TypeHierarchy? typeHierarchy,
  }) {
    return PackageApi(
      packageName: packageName ?? this.packageName,
      packageVersion: packageVersion ?? this.packageVersion,
      packagePath: packagePath ?? this.packagePath,
      interfaceDeclarations:
          interfaceDeclarations ?? this.interfaceDeclarations,
      executableDeclarations:
          executableDeclarations ?? this.executableDeclarations,
      fieldDeclarations: fieldDeclarations ?? this.fieldDeclarations,
      typeAliasDeclarations:
          typeAliasDeclarations ?? this.typeAliasDeclarations,
      semantics: semantics ?? this.semantics,
      androidPlatformConstraints:
          androidPlatformConstraints ?? this.androidPlatformConstraints,
      iosPlatformConstraints:
          iosPlatformConstraints ?? this.iosPlatformConstraints,
      sdkType: sdkType ?? this.sdkType,
      packageDependencies: packageDependencies ?? this.packageDependencies,
      minSdkVersion: minSdkVersion ?? this.minSdkVersion,
      typeHierarchy: typeHierarchy ?? this.typeHierarchy,
    );
  }


  /// returns all root level declarations of this package that don't have any entry points
  Iterable<Declaration>
      get rootDeclarationsWithoutEntryPointsAndVisibleOutsideTests {
    return [
      ...interfaceDeclarations.where((id) =>
          (id.entryPoints?.isEmpty ?? false) && _isUsedOutsideTests(id)),
      ...executableDeclarations.where((ed) => ed.entryPoints?.isEmpty ?? false),
      ...typeAliasDeclarations
          .where((tad) => tad.entryPoints?.isEmpty ?? false),
      ...fieldDeclarations.where((fd) => fd.entryPoints?.isEmpty ?? false),
    ];
  }

  static bool _isUsedOutsideTests(InterfaceDeclaration interfaceDeclaration) {
    return interfaceDeclaration.typeUsages.any((tu) => !tu.isVisibleForTesting);
  }

  @override
  String toString() =>
      'PackageApi(packageName: $packageName, packageVersion: $packageVersion, packagePath: $packagePath, interfaceDeclarations: $interfaceDeclarations, executableDeclarations: $executableDeclarations, fieldDeclarations: $fieldDeclarations, typeAliasDeclarations: $typeAliasDeclarations, semantics: $semantics, androidPlatformConstraints: $androidPlatformConstraints, iosPlatformConstraints: $iosPlatformConstraints, sdkType: $sdkType, packageDependencies: $packageDependencies, minSdkVersion: $minSdkVersion, typeHierarchy: $typeHierarchy)';
}


