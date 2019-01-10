// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) {
  return ProductResponse(
      json['count'] as int,
      (json['products'] as List)
          ?.map((e) =>
              e == null ? null : Product.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{'count': instance.count, 'products': instance.products};

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(json['name'] as String, json['price'] as int);
}

Map<String, dynamic> _$ProductToJson(Product instance) =>
    <String, dynamic>{'name': instance.name, 'price': instance.price};
