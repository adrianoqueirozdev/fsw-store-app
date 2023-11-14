import 'dart:convert';

import 'package:fsw_store/data/models/product.dart';
import 'package:fsw_store/shared/constants/get_storage_keys.dart';
import 'package:get_storage/get_storage.dart';

List<Product> readProductsOnTheGetStorage() {
  final GetStorage getStorage = GetStorage();

  const key = GetStorageKeys.products;
  final products = getStorage.hasData(key) ? jsonEncode(getStorage.read(key)) : '[]';
  var parsed = jsonDecode(products).cast<Map<String, dynamic>>();

  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}
