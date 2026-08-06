import '../../model/model.dart';

class IOSPlatformConstraintsStorageV3 {
  final num? minimumOsVersion;

  const IOSPlatformConstraintsStorageV3({
    required this.minimumOsVersion,
  });

  factory IOSPlatformConstraintsStorageV3.fromJson(Map<String, dynamic> json) =>
      IOSPlatformConstraintsStorageV3(
        minimumOsVersion: json['minimumOsVersion'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'minimumOsVersion': minimumOsVersion,
      };

  static IOSPlatformConstraintsStorageV3? fromIOSPlatformConstraints(
      IOSPlatformConstraints? iosPlatformConstraints) {
    if (iosPlatformConstraints == null) {
      return null;
    }
    return IOSPlatformConstraintsStorageV3(
      minimumOsVersion: iosPlatformConstraints.minimumOsVersion,
    );
  }
}

class AndroidPlatformConstraintsStorageV3 {
  final int? minSdkVersion;
  final int? compileSdkVersion;
  final int? targetSdkVersion;

  const AndroidPlatformConstraintsStorageV3({
    required this.minSdkVersion,
    required this.compileSdkVersion,
    required this.targetSdkVersion,
  });

  factory AndroidPlatformConstraintsStorageV3.fromJson(
          Map<String, dynamic> json) =>
      AndroidPlatformConstraintsStorageV3(
        minSdkVersion: (json['minSdkVersion'] as num?)?.toInt(),
        compileSdkVersion: (json['compileSdkVersion'] as num?)?.toInt(),
        targetSdkVersion: (json['targetSdkVersion'] as num?)?.toInt(),
      );

  Map<String, dynamic> toJson() => {
        'minSdkVersion': minSdkVersion,
        'compileSdkVersion': compileSdkVersion,
        'targetSdkVersion': targetSdkVersion,
      };

  static AndroidPlatformConstraintsStorageV3? fromAndroidPlatformConstraints(
      AndroidPlatformConstraints? constraints) {
    if (constraints == null) {
      return null;
    }
    return AndroidPlatformConstraintsStorageV3(
      minSdkVersion: constraints.minSdkVersion,
      compileSdkVersion: constraints.compileSdkVersion,
      targetSdkVersion: constraints.targetSdkVersion,
    );
  }
}

