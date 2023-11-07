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
  List<String> imageUrls;
  String categoryId;
  int discountPercentage;
  double totalPrice;
  @JsonKey(name: "Category")
  Category? category;

  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.basePrice,
    required this.imageUrls,
    required this.categoryId,
    this.discountPercentage = 0,
    this.totalPrice = 0.0,
    this.category,
  });

  Product copyWith({
    String? id,
    String? name,
    String? slug,
    String? description,
    double? basePrice,
    List<String>? imageUrls,
    String? categoryId,
    int? discountPercentage,
    double? totalPrice,
    Category? category,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      description: description ?? this.description,
      basePrice: basePrice ?? this.basePrice,
      imageUrls: imageUrls ?? this.imageUrls,
      categoryId: categoryId ?? this.categoryId,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      totalPrice: totalPrice ?? this.totalPrice,
      category: category ?? this.category,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
