abstract class RecommendedProductsEvents {}

class GetRecommendedProductsEvent extends RecommendedProductsEvents {
  final String slug;
  final String productId;

  GetRecommendedProductsEvent({required this.slug, required this.productId});
}
