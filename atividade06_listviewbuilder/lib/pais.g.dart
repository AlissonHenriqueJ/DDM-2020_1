// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pais.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pais _$PaisFromJson(Map<String, dynamic> json) {
  return Pais(
    json['name'] as String,
    json['nativeName'] as String,
    json['cioc'] as String,
    json['flag'] as String,
    json['alpha2Code'] as String,
    json['translations'] == null
        ? null
        : Translation.fromJson(json['translations'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PaisToJson(Pais instance) => <String, dynamic>{
      'name': instance.name,
      'nativeName': instance.nativeName,
      'cioc': instance.cioc,
      'flag': instance.flag,
      'alpha2Code': instance.code,
      'translations': instance.translations,
    };
