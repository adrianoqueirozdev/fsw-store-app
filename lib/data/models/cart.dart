import 'package:fsw_store/data/models/product.dart';

class Cart {
  List<Product> products;
  double cartTotalPrice;
  double cartBasePrice;
  double cartTotalDiscount;
  double total;
  double subtotal;
  double totalDiscount;
  Cart({
    required this.products,
    required this.cartTotalPrice,
    required this.cartBasePrice,
    required this.cartTotalDiscount,
    required this.total,
    required this.subtotal,
    required this.totalDiscount,
  });

  Cart copyWith({
    List<Product>? products,
    double? cartTotalPrice,
    double? cartBasePrice,
    double? cartTotalDiscount,
    double? total,
    double? subtotal,
    double? totalDiscount,
  }) {
    return Cart(
      products: products ?? this.products,
      cartTotalPrice: cartTotalPrice ?? this.cartTotalPrice,
      cartBasePrice: cartBasePrice ?? this.cartBasePrice,
      cartTotalDiscount: cartTotalDiscount ?? this.cartTotalDiscount,
      total: total ?? this.total,
      subtotal: subtotal ?? this.subtotal,
      totalDiscount: totalDiscount ?? this.totalDiscount,
    );
  }
}
