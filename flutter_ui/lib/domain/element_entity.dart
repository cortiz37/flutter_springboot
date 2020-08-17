import 'package:json_annotation/json_annotation.dart';

part 'element_entity.g.dart';

@JsonSerializable()
class ElementEntity {
  String id;
  String name;
  String description;
  int amount;
  bool success;

  ElementEntity(
    this.id,
    this.name,
    this.description,
    this.amount,
    this.success,
  );

  ElementEntity.empty({
    this.amount = 0,
    this.success = true,
  });

  factory ElementEntity.fromJson(Map<String, dynamic> json) =>
      _$ElementEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ElementEntityToJson(this);
}
