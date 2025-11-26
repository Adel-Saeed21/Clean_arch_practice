import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/core/networking/network_service.dart';
import 'package:practice/feature/product_page/data/datasource/local_datasource.dart';
import 'package:practice/feature/product_page/data/datasource/remote_datasource.dart';
import 'package:practice/feature/product_page/data/repos_imp/product_repo_imp.dart';
import 'package:practice/feature/product_page/presentation/logic/product_cubit.dart';
import 'package:practice/feature/product_page/presentation/logic/product_state.dart';
import 'package:practice/feature/product_page/presentation/views/widgets/filter_bar.dart';
import 'package:practice/feature/product_page/presentation/views/widgets/product_grid.dart';
import 'package:practice/feature/product_page/presentation/views/widgets/search_bar.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCubit(
        ProductsRepoImpl(
          remoteDatasource: RemoteDataSourceImp(networkService: NetworkServiceImp()),
          localDatasource: LocalDataSourceImp()
        ),
      ),
      child: const ProductsView(),
    );
  }
}

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  String search = "";
  String category = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: Column(
        children: [
          SearchBarWidget(
            onChanged: (v) => setState(() => search = v),
          ),
          FilterBar(
            onChange: (c) => setState(() => category = c),
          ),
          Expanded(
            child: BlocBuilder<ProductCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is ProductsFailure) {
                  return Center(child: Text(state.error.message));
                }

                if (state is ProductsSuccess) {
                  final filtered = state.products.where((p) {
                    final okSearch =
                        p.title.toLowerCase().contains(search.toLowerCase());
                    final okCategory =
                        category == "All" ? true : p.category == category;
                    return okSearch && okCategory;
                  }).toList();

                  return ProductGrid(products: filtered);
                }

                return const SizedBox();
              },
            ),
          )
        ],
      ),
    );
  }
}
