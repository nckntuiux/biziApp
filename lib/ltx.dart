import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:http_parser/http_parser.dart' show MediaType;
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'ltx.g.dart';

@RestApi(baseUrl: "https://lunatex.herokuapp.com")
abstract class LtxClient {
  factory LtxClient(Dio dio, {String baseUrl}) = _LtxClient;

  @GET("/products")
  Future<List<Product>> getProducts();

  @GET('cache')
  @CacheControl(
      maxAge: 180,
      maxStale: 300,
      minFresh: 60,
      noCache: true,
      noStore: true,
      noTransform: true,
      onlyIfCached: true,
      other: ['public', 'proxy-revalidate'])
  @Headers({'test': 'test'})
  Future<String> cache();
}

@JsonSerializable()
class Option {
  @JsonKey(name: 'item_id')
  int itemId;
  String name;
  int price;
  String description;
  @JsonKey(name: 'pack_size')
  int packSize;
  @JsonKey(name: 'pack_weight')
  int packWeight;
  @JsonKey(name: 'pack_volume')
  double packVolume;
  int? image1;
  int? image2;

  Option(
    this.itemId,
    this.name,
    this.price,
    this.description,
    this.packSize,
    this.packWeight,
    this.packVolume,
    this.image1,
    this.image2
  );

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

  Map<String, dynamic> toJson() => _$OptionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Product {
  String? category;
  String name;
  String description;
  List<Option> options;

  Product(this.category, this.name, this.description, this.options);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
