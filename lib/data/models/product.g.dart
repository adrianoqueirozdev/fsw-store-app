// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String,
      basePrice: (json['basePrice'] as num).toDouble(),
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
      categoryId: json['categoryId'] as String,
      discountPercentage: json['discountPercentage'] as int? ?? 0,
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0.0,
      category: json['Category'] == null
          ? null
          : Category.fromJson(json['Category'] as Map<String, dynamic>),
      quantity: json['quantity'] as int? ?? 0,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'basePrice': instance.basePrice,
      'imageUrls': instance.imageUrls,
      'categoryId': instance.categoryId,
      'discountPercentage': instance.discountPercentage,
      'totalPrice': instance.totalPrice,
      'Category': instance.category,
      'quantity': instance.quantity,
    };
