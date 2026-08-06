import 'package:pub_semver/pub_semver.dart';

import '../../model/model.dart';
import 'executable_declaration_storage_v3.dart';
import 'field_declaration_storage_v3.dart';
import 'interface_declaration_storage_v3.dart';
import 'package_dependency_storage_v3.dart';
import 'platform_constraints_storage_v3.dart';
import 'sdk_type_storage_v3.dart';
import 'type_alias_declaration_storage_v3.dart';

class PackageApiStorageV3 {
  final String packageName;
  final String? packageVersion;
  final String packagePath;
  final List<InterfaceDeclarationStorageV3> interfaceDeclarations;
  final List<ExecutableDeclarationStorageV3> executableDeclarations;
  final List<FieldDeclarationStorageV3> fieldDeclarations;
  final List<TypeAliasDeclarationStorageV3> typeAliasDeclarations;
  final Set<PackageApiSemantics> semantics;
  final IOSPlatformConstraintsStorageV3? iosPlatformConstraints;
  final AndroidPlatformConstraintsStorageV3? androidPlatformConstraints;
  final SdkTypeStorageV3 sdkType;
  final Version minSdkVersion;
  final List<PackageDependencyStorageV3> packageDependencies;

  const PackageApiStorageV3({
    required this.packageName,
    required this.packageVersion,
    required this.packagePath,
    required this.interfaceDeclarations,
    required this.executableDeclarations,
    required this.fieldDeclarations,
    required this.typeAliasDeclarations,
    required this.semantics,
    this.iosPlatformConstraints,
    this.androidPlatformConstraints,
    required this.sdkType,
    required this.minSdkVersion,
    required this.packageDependencies,
  });

  factory PackageApiStorageV3.fromJson(Map<String, dynamic> json) =>
      PackageApiStorageV3(
        packageName: json['packageName'] as String,
        packageVersion: json['packageVersion'] as String?,
        packagePath: json['packagePath'] as String,
        interfaceDeclarations: (json['interfaceDeclarations'] as List<dynamic>)
            .map((e) => InterfaceDeclarationStorageV3.fromJson(
                e as Map<String, dynamic>))
            .toList(),
        executableDeclarations:
            (json['executableDeclarations'] as List<dynamic>)
                .map((e) => ExecutableDeclarationStorageV3.fromJson(
                    e as Map<String, dynamic>))
                .toList(),
        fieldDeclarations: (json['fieldDeclarations'] as List<dynamic>)
            .map((e) =>
                FieldDeclarationStorageV3.fromJson(e as Map<String, dynamic>))
            .toList(),
        typeAliasDeclarations: (json['typeAliasDeclarations'] as List<dynamic>)
            .map((e) => TypeAliasDeclarationStorageV3.fromJson(
                e as Map<String, dynamic>))
            .toList(),
        semantics: (json['semantics'] as List<dynamic>)
            .map((e) => PackageApiSemantics.values.byName(e as String))
            .toSet(),
        iosPlatformConstraints: json['iosPlatformConstraints'] == null
            ? null
            : IOSPlatformConstraintsStorageV3.fromJson(
                json['iosPlatformConstraints'] as Map<String, dynamic>),
        androidPlatformConstraints: json['androidPlatformConstraints'] == null
            ? null
            : AndroidPlatformConstraintsStorageV3.fromJson(
                json['androidPlatformConstraints'] as Map<String, dynamic>),
        sdkType: SdkTypeStorageV3.values.byName(json['sdkType'] as String),
        minSdkVersion: Version.parse(json['minSdkVersion'] as String),
        packageDependencies: (json['packageDependencies'] as List<dynamic>)
            .map((e) => PackageDependencyStorageV3.fromJson(
                e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'packageName': packageName,
        'packageVersion': packageVersion,
        'packagePath': packagePath,
        'interfaceDeclarations':
            interfaceDeclarations.map((e) => e.toJson()).toList(),
        'executableDeclarations':
            executableDeclarations.map((e) => e.toJson()).toList(),
        'fieldDeclarations': fieldDeclarations.map((e) => e.toJson()).toList(),
        'typeAliasDeclarations':
            typeAliasDeclarations.map((e) => e.toJson()).toList(),
        'semantics': semantics.map((e) => e.name).toList(),
        'iosPlatformConstraints': iosPlatformConstraints?.toJson(),
        'androidPlatformConstraints': androidPlatformConstraints?.toJson(),
        'sdkType': sdkType.name,
        'minSdkVersion': minSdkVersion.canonicalizedVersion,
        'packageDependencies':
            packageDependencies.map((e) => e.toJson()).toList(),
      };

  /// Returns a [PackageApiStorageV3] from a [PackageApi].
  static PackageApiStorageV3 fromPackageAPi(PackageApi packageApi) {
    return PackageApiStorageV3(
      packageName: packageApi.packageName,
      packageVersion: packageApi.packageVersion,
      packagePath: packageApi.packagePath,
      interfaceDeclarations: packageApi.interfaceDeclarations
          .map((c) =>
              InterfaceDeclarationStorageV3.fromInterfaceDeclaration(c))
          .toList(),
      executableDeclarations: packageApi.executableDeclarations
          .map((e) =>
              ExecutableDeclarationStorageV3.fromExecutableDeclaration(e))
          .toList(),
      fieldDeclarations: packageApi.fieldDeclarations
          .map((f) => FieldDeclarationStorageV3.fromFieldDeclaration(f))
          .toList(),
      typeAliasDeclarations: packageApi.typeAliasDeclarations
          .map((t) =>
              TypeAliasDeclarationStorageV3.fromTypeAliasDeclaration(t))
          .toList(),
      semantics: packageApi.semantics,
      iosPlatformConstraints:
          IOSPlatformConstraintsStorageV3.fromIOSPlatformConstraints(
              packageApi.iosPlatformConstraints),
      androidPlatformConstraints:
          AndroidPlatformConstraintsStorageV3.fromAndroidPlatformConstraints(
              packageApi.androidPlatformConstraints),
      sdkType: SdkTypeStorageV3.fromSdkType(packageApi.sdkType),
      minSdkVersion: packageApi.minSdkVersion,
      packageDependencies: packageApi.packageDependencies
          .map((d) => PackageDependencyStorageV3.fromPackageDependency(d))
          .toList(),
    );
  }
}

