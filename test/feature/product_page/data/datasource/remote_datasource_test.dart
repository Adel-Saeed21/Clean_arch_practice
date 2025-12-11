import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:practice/core/networking/network_service.dart';
import 'package:mockito/annotations.dart';
import 'package:practice/feature/product_page/data/datasource/remote_datasource.dart';
import 'package:practice/feature/product_page/data/models/product_model.dart';

import 'remote_datasource_test.mocks.dart';

@GenerateMocks([NetworkService])
void main() {
  late RemoteDataSourceImp remoteDataSource;
  late NetworkService mockNetworkService;

  setUp(() {
    mockNetworkService = MockNetworkService();
    remoteDataSource = RemoteDataSourceImp(networkService: mockNetworkService);
  });
  test('GetProducts should return Products without any exception', () async {
    final products = List.generate(
      5,
      (index) => ProductModel(
        id: index.toInt(),
        title: "title $index",
        description: "Desc $index",
        category: "Category $index",
        price: index.toDouble(),
        discountPercentage: index.toDouble(),
        rating: index.toDouble(),
      ),
    );

    final productsMap = products.map((e) => e.toJson()).toList();

    when(mockNetworkService.get("products")).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(path: 'products'),
        data: {'products': productsMap},
        statusCode: 200,
      ),
    );

    final result = await remoteDataSource.getProducts();
    for (var i = 0; i < products.length; i++) {
      expect(result[i].id, products[i].id);
      expect(result[i].title, products[i].title);
      expect(result[i].description, products[i].description);
      expect(result[i].category, products[i].category);
      expect(result[i].price, products[i].price);
      expect(result[i].discountPercentage, products[i].discountPercentage);
      expect(result[i].rating, products[i].rating);
    }
  });
}
