import 'dart:io';

import 'package:fruits_app/core/models/review_model.dart';

import '../entities/product_entity.dart';
import '../helper_function/get_avg_rating.dart';
class ProductEntityModel {
  final String name;
  final String code;
  final num quantity;
  final String description;
  final num price;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numOfCalories;
  final num avgRating;
  final num ratingCount;
  final int unitAmount;
  final List<ReviewModel> reviews;
  final int sellingCount;

  // upload image to storage first and put url into firebase

  ProductEntityModel({required this.name, required this.reviews,
    required this.expirationMonths, required this.numOfCalories, required this.unitAmount,
    required this.code, required this.quantity, required this.description, required this.price, required this.isFeatured, this.imageUrl,
    this.isOrganic = false, this.ratingCount = 0, this.avgRating = 0, this.sellingCount = 0
  });

  factory ProductEntityModel.fromJson(Map<String, dynamic>json){
    return ProductEntityModel(
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      quantity: json['quantity'] ?? 0,
      description: json['description'] ?? '',
      price: json['price'] ?? 0,
      isFeatured: json['isFeatured'] ?? false,
      imageUrl: json['imageUrl'] ?? '',
      expirationMonths: json['expirationMonths'] ?? 0,
      isOrganic: json['isOrganic'] ?? false,
      numOfCalories: json['numOfCalories'] ?? 0,
      avgRating: json['reviews'] != null ?getAvgRating(List<ReviewModel>.from(json['reviews'].map((e)=>ReviewModel.fromJson(e)))): 0,
      ratingCount: json['ratingCount'] ?? 0,
      unitAmount: json['unitAmount'] ?? 0,
      sellingCount: json['sellingCount'] ?? 0,
      reviews: json['reviews'] != null ? List<ReviewModel>.from(
          json['reviews'].map((e) => ReviewModel.fromJson(e)))
          : [],
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'quantity': quantity,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isFeatured': isFeatured,
      'expirationMonths': expirationMonths,
      'isOrganic': isOrganic,
      'numOfCalories': numOfCalories,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'unitAmount': unitAmount,
      'sellingCount': sellingCount,
      'reviews': reviews.map((e) => e.toJson()).toList(),

    };
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      code: code,
      quantity: quantity,
      description: description,
      price: price,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
      expirationMonths: expirationMonths,
      isOrganic: isOrganic,
      numOfCalories: numOfCalories,
      avgRating: avgRating,
      ratingCount: ratingCount,
      unitAmount: unitAmount,
      sellingCount: sellingCount,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }
}

