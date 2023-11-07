import 'package:fsw_store/data/models/product.dart';

Product computeProductTotalPrice(Product product) {
  if (product.discountPercentage == 0) {
    return product.copyWith(totalPrice: product.basePrice);
  }

  final totalDiscount = product.basePrice * (product.discountPercentage / 100);

  return product.copyWith(totalPrice: product.basePrice - totalDiscount);
}
