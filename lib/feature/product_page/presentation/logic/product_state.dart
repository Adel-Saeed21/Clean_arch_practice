import 'package:flutter/material.dart';

import 'package:practice/core/networking/api_error_model.dart';
import 'package:practice/feature/product_page/data/models/product_model.dart';


@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<ProductModel> products;
  ProductsSuccess(this.products);
}

final class ProductsFailure extends ProductsState {

  final ApiErrorModel error;
  ProductsFailure(this.error);
}