import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fruits_app/core/entities/review_entity.dart';

class ProductEntity extends Equatable{
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
  final int sellingCount;
  final List<ReviewEntity> reviews;
  // upload image to storage first and put url into firebase

  ProductEntity( {required this.name, required this.code, required this.quantity,
    required this.reviews,
    required this.expirationMonths, required this.numOfCalories,required this.unitAmount,
    required this.description, required this.price, required this.isFeatured, this.imageUrl,
    this.avgRating=0,this.isOrganic=false,this.ratingCount=0,this.sellingCount=0,

  });

  @override
  // TODO: implement props
  List<Object?> get props => [code];




}