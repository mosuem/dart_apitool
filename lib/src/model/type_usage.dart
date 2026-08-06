import 'type_usage_kind.dart';

/// represents the usage of a type
class TypeUsage {
  /// kind of usage
  final TypeUsageKind kind;

  /// the name of the referring element
  final String referringElementName;

  /// defines if the usage happened in a visibleForTesting context
  final bool isVisibleForTesting;

  const TypeUsage({
    required this.kind,
    required this.referringElementName,
    required this.isVisibleForTesting,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypeUsage &&
          runtimeType == other.runtimeType &&
          kind == other.kind &&
          referringElementName == other.referringElementName &&
          isVisibleForTesting == other.isVisibleForTesting;

  @override
  int get hashCode =>
      Object.hash(kind, referringElementName, isVisibleForTesting);
}

