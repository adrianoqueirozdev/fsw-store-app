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
      imagesUrls: (json['imagesUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      categoryId: json['categoryId'] as String,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      discountPercentage: json['discountPercentage'] as int? ?? 0,
      orderProduct: json['orderProduct'] as List<dynamic>,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'basePrice': instance.basePrice,
      'imagesUrls': instance.imagesUrls,
      'categoryId': instance.categoryId,
      'category': instance.category,
      'discountPercentage': instance.discountPercentage,
      'orderProduct': instance.orderProduct,
    };
