import 'package:hive/hive.dart';
import 'package:practice/feature/product_page/data/models/product_model.dart';

abstract class LocalDatasource {
  Future<void> cacheProducts(List<ProductModel> products);
  Future<List<ProductModel>> getCachedProducts();
}

class LocalDataSourceImp extends LocalDatasource {
  static const String boxName = "products";

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    final box = await Hive.openBox<ProductModel>(boxName);
    await box.clear();
    for (var product in products) {
      await box.put(product.id, product);
    }
  }

  @override
  Future<List<ProductModel>> getCachedProducts() async {
    final box = await Hive.openBox<ProductModel>(boxName);
    return box.values.toList();
  }
}
