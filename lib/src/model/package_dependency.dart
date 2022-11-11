import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_dependency.freezed.dart';

@freezed

/// represents a package dependency
class PackageDependency with _$PackageDependency {
  factory PackageDependency({
    /// name of the package
    required String packageName,

    /// String representation of the version range
    required String packageVersion,
  }) = _PackageDependency;
}
