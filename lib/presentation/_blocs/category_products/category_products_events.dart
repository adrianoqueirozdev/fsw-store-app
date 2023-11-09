abstract class CategoryProductsEvents {
  final String slug;

  CategoryProductsEvents({required this.slug});
}

class GetCategoryProductsEvent extends CategoryProductsEvents {
  GetCategoryProductsEvent({required String slug}) : super(slug: slug);
}
