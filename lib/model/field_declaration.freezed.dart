// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'field_declaration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FieldDeclaration _$FieldDeclarationFromJson(Map<String, dynamic> json) {
  return _FieldDeclaration.fromJson(json);
}

/// @nodoc
mixin _$FieldDeclaration {
  String get typeName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FieldDeclarationCopyWith<FieldDeclaration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldDeclarationCopyWith<$Res> {
  factory $FieldDeclarationCopyWith(
          FieldDeclaration value, $Res Function(FieldDeclaration) then) =
      _$FieldDeclarationCopyWithImpl<$Res>;
  $Res call({String typeName, String name});
}

/// @nodoc
class _$FieldDeclarationCopyWithImpl<$Res>
    implements $FieldDeclarationCopyWith<$Res> {
  _$FieldDeclarationCopyWithImpl(this._value, this._then);

  final FieldDeclaration _value;
  // ignore: unused_field
  final $Res Function(FieldDeclaration) _then;

  @override
  $Res call({
    Object? typeName = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      typeName: typeName == freezed
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_FieldDeclarationCopyWith<$Res>
    implements $FieldDeclarationCopyWith<$Res> {
  factory _$$_FieldDeclarationCopyWith(
          _$_FieldDeclaration value, $Res Function(_$_FieldDeclaration) then) =
      __$$_FieldDeclarationCopyWithImpl<$Res>;
  @override
  $Res call({String typeName, String name});
}

/// @nodoc
class __$$_FieldDeclarationCopyWithImpl<$Res>
    extends _$FieldDeclarationCopyWithImpl<$Res>
    implements _$$_FieldDeclarationCopyWith<$Res> {
  __$$_FieldDeclarationCopyWithImpl(
      _$_FieldDeclaration _value, $Res Function(_$_FieldDeclaration) _then)
      : super(_value, (v) => _then(v as _$_FieldDeclaration));

  @override
  _$_FieldDeclaration get _value => super._value as _$_FieldDeclaration;

  @override
  $Res call({
    Object? typeName = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_FieldDeclaration(
      typeName: typeName == freezed
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FieldDeclaration extends _FieldDeclaration {
  const _$_FieldDeclaration({required this.typeName, required this.name})
      : super._();

  factory _$_FieldDeclaration.fromJson(Map<String, dynamic> json) =>
      _$$_FieldDeclarationFromJson(json);

  @override
  final String typeName;
  @override
  final String name;

  @override
  String toString() {
    return 'FieldDeclaration(typeName: $typeName, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FieldDeclaration &&
            const DeepCollectionEquality().equals(other.typeName, typeName) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(typeName),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_FieldDeclarationCopyWith<_$_FieldDeclaration> get copyWith =>
      __$$_FieldDeclarationCopyWithImpl<_$_FieldDeclaration>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FieldDeclarationToJson(
      this,
    );
  }
}

abstract class _FieldDeclaration extends FieldDeclaration {
  const factory _FieldDeclaration(
      {required final String typeName,
      required final String name}) = _$_FieldDeclaration;
  const _FieldDeclaration._() : super._();

  factory _FieldDeclaration.fromJson(Map<String, dynamic> json) =
      _$_FieldDeclaration.fromJson;

  @override
  String get typeName;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_FieldDeclarationCopyWith<_$_FieldDeclaration> get copyWith =>
      throw _privateConstructorUsedError;
}
