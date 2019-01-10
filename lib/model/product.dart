import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';
@JsonSerializable()
class ProductResponse extends Object {
  @JsonKey(name: 'count')
  final int count;
  @JsonKey(name: 'products')
  final List<Product> products;

  ProductResponse(
      this.count,
      this.products
      );
factory ProductResponse.fromJson(Map<String, dynamic>json) => _$ProductResponseFromJson(json);
Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

@JsonSerializable()
class Product extends Object {
  @JsonKey(name: 'name')
final String name;
  @JsonKey(name: 'price')
final int price;

Product(this.name, this.price);

factory Product.fromJson(Map<String, dynamic>json) => _$ProductFromJson(json);
Map<String, dynamic> toJson() => _$ProductToJson(this);

}
