// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      status: json['status'] as String?,
      orderProduct: (json['OrderProduct'] as List<dynamic>?)
          ?.map((e) => OrderProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'status': instance.status,
      'OrderProduct': instance.orderProduct,
    };

OrderProduct _$OrderProductFromJson(Map<String, dynamic> json) => OrderProduct(
      id: json['id'] as String?,
      productId: json['productId'] as String?,
      orderId: json['orderId'] as String?,
      basePrice: (json['basePrice'] as num?)?.toDouble(),
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
      quantity: json['quantity'] as int?,
      product: json['Product'] == null
          ? null
          : Product.fromJson(json['Product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderProductToJson(OrderProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'orderId': instance.orderId,
      'basePrice': instance.basePrice,
      'discountPercentage': instance.discountPercentage,
      'quantity': instance.quantity,
      'Product': instance.product,
    };
