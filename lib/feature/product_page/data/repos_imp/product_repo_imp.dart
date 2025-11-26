import 'package:practice/core/networking/api_result.dart';
import 'package:practice/feature/product_page/data/datasource/local_datasource.dart';
import 'package:practice/feature/product_page/data/datasource/remote_datasource.dart';
import 'package:practice/feature/product_page/data/models/product_model.dart';
import 'package:practice/feature/product_page/domain/repos/products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {
  final RemoteDatasource remoteDatasource;
  final LocalDatasource localDatasource;

  ProductsRepoImpl({
    required this.remoteDatasource,
    required this.localDatasource,
  });

  @override
  Future<ApiResult<List<ProductModel>>> getProducts() async {
    try {
      final products = await remoteDatasource.getProducts();
      await localDatasource.cacheProducts(products);
      return ApiResult.success(products);
    } catch (e) {
      final cached = await localDatasource.getCachedProducts();
      if (cached.isNotEmpty) return ApiResult.success(cached);
      return ApiResult.error(e);
    }
  }
}
