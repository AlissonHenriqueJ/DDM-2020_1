import 'package:json_annotation/json_annotation.dart';

import 'translation.dart';

part 'pais.g.dart';

@JsonSerializable()
class Pais {
  String name;
  String nativeName;
  String cioc;
  String flag;
  String code;

  Translation translations;

  Pais(this.name, this.nativeName, this.cioc, this.flag,this.code, this.translations);

  factory Pais.fromJson(Map<String, dynamic> json) => _$PaisFromJson(json);

  Map<String, dynamic> toJson() => _$PaisToJson(this);
}
