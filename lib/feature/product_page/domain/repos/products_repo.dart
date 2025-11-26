import 'package:practice/core/networking/api_result.dart';
import 'package:practice/feature/product_page/data/models/product_model.dart';

abstract class ProductsRepo {
    Future<ApiResult<List<ProductModel>>>  getProducts();
}