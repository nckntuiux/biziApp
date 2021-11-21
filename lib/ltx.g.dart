// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ltx.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Option _$OptionFromJson(Map<String, dynamic> json) {
  return Option(
    json['item_id'] as int,
    json['name'] as String,
    json['price'] as int,
    json['description'] as String,
    json['pack_size'] as int,
    json['pack_weight'] as int,
    (json['pack_volume'] as num).toDouble(),
    json['image1'] as int?,
    json['image2'] as int?,
  );
}

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'item_id': instance.itemId,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'pack_size': instance.packSize,
      'pack_weight': instance.packWeight,
      'pack_volume': instance.packVolume,
      'image1': instance.image1,
      'image2': instance.image2,
    };

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    json['category'] as String?,
    json['name'] as String,
    json['description'] as String,
    (json['options'] as List<dynamic>)
        .map((e) => Option.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'category': instance.category,
      'name': instance.name,
      'description': instance.description,
      'options': instance.options.map((e) => e.toJson()).toList(),
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _LtxClient implements LtxClient {
  _LtxClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://lunatex.herokuapp.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Product>> getProducts() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Product>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/products',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Product.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<Product>> getProductsByCategory(category) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Product>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/products/$category',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Product.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<String> cache() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<String>(_setStreamType<String>(Options(
            method: 'GET',
            headers: <String, dynamic>{
              r'test': 'test',
              r'cache-control':
                  'max-age=180, max-stale=300, max-fresh=60, no-cache, no-store, no-transform, only-if-cached, public, proxy-revalidate'
            },
            extra: _extra)
        .compose(_dio.options, 'cache',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
