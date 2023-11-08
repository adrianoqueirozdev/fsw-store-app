abstract class ProductEvents {
  final String id;

  ProductEvents({required this.id});
}

class GetProductEvent extends ProductEvents {
  GetProductEvent({required String id}) : super(id: id);
}
