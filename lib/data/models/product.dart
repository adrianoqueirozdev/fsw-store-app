import 'package:fsw_store/data/models/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  String id;
  String name;
  String slug;
  String description;
  double basePrice;
  List<String> imagesUrls;
  String categoryId;
  Category category;
  int discountPercentage;
  List<dynamic> orderProduct;

  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.basePrice,
    required this.imagesUrls,
    required this.categoryId,
    required this.category,
    this.discountPercentage = 0,
    required this.orderProduct,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
