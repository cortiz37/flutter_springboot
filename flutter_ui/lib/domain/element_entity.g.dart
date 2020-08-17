// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElementEntity _$ElementEntityFromJson(Map<String, dynamic> json) {
  return ElementEntity(
    json['id'] as String,
    json['name'] as String,
    json['description'] as String,
    json['amount'] as int,
    json['success'] as bool,
  );
}

Map<String, dynamic> _$ElementEntityToJson(ElementEntity instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'amount': instance.amount,
      'success': instance.success,
    };
