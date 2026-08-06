/// represents iOS platform constraints
class IOSPlatformConstraints {
  /// minimum iOS version
  final num? minimumOsVersion;

  const IOSPlatformConstraints({
    required this.minimumOsVersion,
  });

  IOSPlatformConstraints copyWith({
    num? minimumOsVersion,
  }) {
    return IOSPlatformConstraints(
      minimumOsVersion: minimumOsVersion ?? this.minimumOsVersion,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IOSPlatformConstraints &&
          runtimeType == other.runtimeType &&
          minimumOsVersion == other.minimumOsVersion;

  @override
  int get hashCode => minimumOsVersion.hashCode;
}

/// represents Android platform constraints
class AndroidPlatformConstraints {
  /// minimum SDK version
  final int? minSdkVersion;

  /// compile SDK version
  final int? compileSdkVersion;

  /// target SDK version
  final int? targetSdkVersion;

  const AndroidPlatformConstraints({
    required this.minSdkVersion,
    required this.compileSdkVersion,
    required this.targetSdkVersion,
  });

  AndroidPlatformConstraints copyWith({
    int? minSdkVersion,
    int? compileSdkVersion,
    int? targetSdkVersion,
  }) {
    return AndroidPlatformConstraints(
      minSdkVersion: minSdkVersion ?? this.minSdkVersion,
      compileSdkVersion: compileSdkVersion ?? this.compileSdkVersion,
      targetSdkVersion: targetSdkVersion ?? this.targetSdkVersion,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AndroidPlatformConstraints &&
          runtimeType == other.runtimeType &&
          minSdkVersion == other.minSdkVersion &&
          compileSdkVersion == other.compileSdkVersion &&
          targetSdkVersion == other.targetSdkVersion;

  @override
  int get hashCode =>
      Object.hash(minSdkVersion, compileSdkVersion, targetSdkVersion);
}

