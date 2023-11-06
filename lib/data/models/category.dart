import 'package:fsw_store/data/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  String? id;
  String? name;
  String? slug;
  String? imageUrl;
  List<Product>? products;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.imageUrl,
    required this.products,
  });

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
