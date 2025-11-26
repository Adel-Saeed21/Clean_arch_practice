# Practice – Flutter Clean Architecture App

This project is a Flutter application structured using Clean Architecture and Cubit (Bloc) for state management.
The architecture separates the app into clear layers (Presentation, Domain, Data) and provides a scalable foundation for real-world projects.

Features
🔹 Full Clean Architecture structure
🔹 State management with Cubit
🔹 Remote & Local Data Sources
🔹 Repository Pattern
🔹 Product listing in a grid layout
🔹 Organized Widgets (Product Item, Search Bar, Filter Bar)
🔹 Easy to extend and maintain

Project Structure


feature/product_page/
 ├── data/
 │   ├── datasource/
 │   │     ├── local_datasource.dart
 │   │     ├── remote_datasource.dart
 │   ├── models/product_model.dart
 │   ├── repos_impl/products_repo_impl.dart
 ├── domain/
 │   ├── repos/products_repo.dart
 ├── presentation/
 │   ├── logic/
 │   │     ├── product_cubit.dart
 │   │     ├── product_state.dart
 │   ├── pages/
 │         ├── products_page.dart
 │         ├── widgets/product_item.dart
 │         ├── widgets/product_grid.dart
 │         ├── widgets/search_bar.dart
 │         ├── widgets/filter_bar.dart



 Layer Explanation
1️ Data Layer

Handles data operations and repository implementations:

remote_datasource.dart
Communicates with APIs / server.

local_datasource.dart
Manages local storage (Hive).

product_model.dart
Data model for API responses.

products_repo_impl.dart
Repository implementation connecting domain with data sources.

 2. Domain Layer

Defines the core logic contracts:
products_repo.dart
Abstract repository interface implemented in the Data Layer.
(UseCases can be added later if the project grows.)


Presentation Layer

UI and State Management:
product_cubit.dart, product_state.dart
Handle product states and business logic for UI.

UI pages & widgets:
products_page.dart
product_item.dart
product_grid.dart
search_bar.dart
filter_bar.dart


