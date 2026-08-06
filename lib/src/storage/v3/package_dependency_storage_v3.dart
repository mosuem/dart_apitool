import '../../model/model.dart';

/// represents a package dependency
class PackageDependencyStorageV3 {
  final String packageName;
  final String? packageVersion;

  const PackageDependencyStorageV3({
    required this.packageName,
    required this.packageVersion,
  });

  factory PackageDependencyStorageV3.fromJson(Map<String, dynamic> json) =>
      PackageDependencyStorageV3(
        packageName: json['packageName'] as String,
        packageVersion: json['packageVersion'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'packageName': packageName,
        'packageVersion': packageVersion,
      };

  static PackageDependencyStorageV3 fromPackageDependency(
      PackageDependency packageDependency) {
    return PackageDependencyStorageV3(
      packageName: packageDependency.packageName,
      packageVersion: packageDependency.packageVersion,
    );
  }
}

