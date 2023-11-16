import 'package:fsw_store/data/models/order.dart';
import 'package:fsw_store/shared/helpers/computed_total_price.dart';
import 'package:get/get.dart';

class OrderItemController extends GetxController {
  final List<OrderProduct> orderProducts;

  OrderItemController(this.orderProducts);

  final _subtotal = 0.0.obs;
  final _total = 0.0.obs;

  double get subtotal => _subtotal.value;
  double get total => _total.value;
  double get totalsDiscounts => _subtotal.value - _total.value;

  @override
  void onInit() {
    final subtotal = orderProducts.fold(
        0.0, (previousValue, element) => previousValue + element.product!.basePrice * element.quantity!);
    _subtotal(subtotal);

    final total = orderProducts.fold(0.0, (previousValue, element) {
      final product = computeProductTotalPrice(element.product!);

      return previousValue + product.totalPrice * element.quantity!;
    });
    _total(total);

    super.onInit();
  }
}
