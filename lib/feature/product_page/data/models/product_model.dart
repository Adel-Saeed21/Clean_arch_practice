
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';
@HiveType(typeId: 1)
@JsonSerializable()
class ProductModel {
    @HiveField(0)
   final int id;
     @HiveField(1)
  final String title;
    @HiveField(2)
  final String description;
    @HiveField(4)
  final String category;
    @HiveField(5)
  final double price;
    @HiveField(6)
  final double discountPercentage;
    @HiveField(7)
  final double rating;

  ProductModel({required this.id, required this.title, required this.description, required this.category, required this.price, required this.discountPercentage, required this.rating});

    factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}