import 'package:practice/core/networking/api_const.dart';
import 'package:practice/core/networking/network_service.dart';
import 'package:practice/feature/product_page/data/models/product_model.dart';

abstract class RemoteDatasource {
  Future<List<ProductModel>> getProducts();
}

class RemoteDataSourceImp extends RemoteDatasource {
  final NetworkService networkService;

  RemoteDataSourceImp({required this.networkService});
  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await networkService.get(ApiConst.products);
    if (response.statusCode != 200) throw Exception();
    final result = response.data['products'] as List;

    final products = result.map((post) => ProductModel.fromJson(post)).toList();
    return products;
  }
}
