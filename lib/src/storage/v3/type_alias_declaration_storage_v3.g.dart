// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'type_alias_declaration_storage_v3.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TypeAliasDeclarationStorageV3 _$$_TypeAliasDeclarationStorageV3FromJson(
        Map<String, dynamic> json) =>
    _$_TypeAliasDeclarationStorageV3(
      name: json['name'] as String,
      aliasedTypeName: json['aliasedTypeName'] as String,
      isDeprecated: json['isDeprecated'] as bool,
      isExperimental: json['isExperimental'] as bool,
      entryPoints: (json['entryPoints'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
    );

Map<String, dynamic> _$$_TypeAliasDeclarationStorageV3ToJson(
        _$_TypeAliasDeclarationStorageV3 instance) =>
    <String, dynamic>{
      'name': instance.name,
      'aliasedTypeName': instance.aliasedTypeName,
      'isDeprecated': instance.isDeprecated,
      'isExperimental': instance.isExperimental,
      'entryPoints': instance.entryPoints.toList(),
    };
