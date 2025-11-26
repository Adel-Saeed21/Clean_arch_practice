import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/feature/product_page/domain/repos/products_repo.dart';
import 'package:practice/feature/product_page/presentation/logic/product_state.dart';

class ProductCubit extends Cubit<ProductsState> {
  ProductCubit(this.repo) : super(ProductsInitial()) {
    getProducts();
  }

  final ProductsRepo repo;

  getProducts() async {
    emit(ProductsLoading());
    final result = await repo.getProducts();
    result.when(
      onSuccess: (data) {
        emit(ProductsSuccess(data));
      },
      onError: (e) {
        emit(ProductsFailure(e));
      },
    );
  }
}
