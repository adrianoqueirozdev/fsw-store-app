import 'package:fsw_store/data/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  String? id;
  String? userId;
  String? createdAt;
  String? updatedAt;
  String? status;
  @JsonKey(name: "OrderProduct")
  List<OrderProduct>? orderProduct;

  Order({
    this.id,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.orderProduct,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class OrderProduct {
  String? id;
  String? productId;
  String? orderId;
  double? basePrice;
  double? discountPercentage;
  int? quantity;
  @JsonKey(name: "Product")
  Product? product;

  OrderProduct({
    this.id,
    this.productId,
    this.orderId,
    this.basePrice,
    this.discountPercentage,
    this.quantity,
    this.product,
  });

  factory OrderProduct.fromJson(Map<String, dynamic> json) => _$OrderProductFromJson(json);

  Map<String, dynamic> toJson() => _$OrderProductToJson(this);
}
