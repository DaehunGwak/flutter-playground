// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_info.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductInfoDto _$ProductInfoDtoFromJson(Map<String, dynamic> json) =>
    _ProductInfoDto(
      productId: json['productId'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      price: (json['price'] as num?)?.toInt() ?? -1,
      originalPrice: (json['originalPrice'] as num?)?.toInt() ?? -1,
      discountRate: (json['discountRate'] as num?)?.toInt() ?? -1,
      reviewCount: (json['reviewCount'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$ProductInfoDtoToJson(_ProductInfoDto instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'originalPrice': instance.originalPrice,
      'discountRate': instance.discountRate,
      'reviewCount': instance.reviewCount,
    };
