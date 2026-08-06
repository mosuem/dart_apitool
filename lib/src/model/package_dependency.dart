/// represents a package dependency
class PackageDependency {
  /// name of the package
  final String packageName;

  /// String representation of the version range. Can be null if the dependency is a path or git dependency
  final String? packageVersion;

  const PackageDependency({
    required this.packageName,
    required this.packageVersion,
  });

  PackageDependency copyWith({
    String? packageName,
    String? packageVersion,
  }) {
    return PackageDependency(
      packageName: packageName ?? this.packageName,
      packageVersion: packageVersion ?? this.packageVersion,
    );
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PackageDependency &&
          runtimeType == other.runtimeType &&
          packageName == other.packageName &&
          packageVersion == other.packageVersion;

  @override
  int get hashCode => Object.hash(packageName, packageVersion);

  @override
  String toString() =>
      'PackageDependency(packageName: $packageName, packageVersion: $packageVersion)';
}


