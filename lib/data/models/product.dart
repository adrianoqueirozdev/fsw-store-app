// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:fsw_store/data/models/category.dart';

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
  int quantity;

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
    this.quantity = 0,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

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
    int? quantity,
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
      quantity: quantity ?? this.quantity,
    );
  }
}
