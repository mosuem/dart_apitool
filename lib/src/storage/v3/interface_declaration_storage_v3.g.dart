// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'interface_declaration_storage_v3.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InterfaceDeclarationStorageV3 _$$_InterfaceDeclarationStorageV3FromJson(
        Map<String, dynamic> json) =>
    _$_InterfaceDeclarationStorageV3(
      name: json['name'] as String,
      isDeprecated: json['isDeprecated'] as bool,
      isExperimental: json['isExperimental'] as bool,
      isRequired: json['isRequired'] as bool,
      typeParameterNames: (json['typeParameterNames'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      superTypeNames: (json['superTypeNames'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      executableDeclarations: (json['executableDeclarations'] as List<dynamic>)
          .map((e) => ExecutableDeclarationStorageV3.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      fieldDeclarations: (json['fieldDeclarations'] as List<dynamic>)
          .map((e) =>
              FieldDeclarationStorageV3.fromJson(e as Map<String, dynamic>))
          .toList(),
      entryPoints: (json['entryPoints'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
    );

Map<String, dynamic> _$$_InterfaceDeclarationStorageV3ToJson(
        _$_InterfaceDeclarationStorageV3 instance) =>
    <String, dynamic>{
      'name': instance.name,
      'isDeprecated': instance.isDeprecated,
      'isExperimental': instance.isExperimental,
      'isRequired': instance.isRequired,
      'typeParameterNames': instance.typeParameterNames,
      'superTypeNames': instance.superTypeNames,
      'executableDeclarations': instance.executableDeclarations,
      'fieldDeclarations': instance.fieldDeclarations,
      'entryPoints': instance.entryPoints.toList(),
    };
