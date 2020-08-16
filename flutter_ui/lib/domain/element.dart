import 'package:json_annotation/json_annotation.dart';

part 'element.g.dart';

@JsonSerializable()
class Element {
  final String id;
  final String name;
  final String description;
  final int amount;
  final bool success;

  Element(
    this.id,
    this.name,
    this.description,
    this.amount,
    this.success,
  );

  factory Element.fromJson(Map<String, dynamic> json) =>
      _$ElementFromJson(json);

  Map<String, dynamic> toJson() => _$ElementToJson(this);
}
