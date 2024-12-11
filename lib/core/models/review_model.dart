
import '../entities/review_entity.dart';

class ReviewModel{
  final String name;
  final String description;
  final num rating;
  final String date;
  final String image;

  ReviewModel({required this.name, required this.description, required this.rating, required this.date, required this.image});
  factory ReviewModel.fromEntiy(ReviewEntity reviewEntity){
    return ReviewModel(
      name: reviewEntity.name,
      description: reviewEntity.description,
      rating: reviewEntity.rating,
      date: reviewEntity.date,
      image: reviewEntity.image
    );
  }
  factory ReviewModel.fromJson(Map<String,dynamic>json){
    return ReviewModel(
      name: json['name'],
      description: json['description'],
      rating: json['rating'],
      date: json['date'],
      image: json['image']
    );
  }
  toJson(){
    return {
      'name': name,
      'description': description,
      'rating': rating,
      'date': date,
      'image': image
    };
  }
  ReviewEntity toEntity(){
    return ReviewEntity(
      name: name,
      description: description,
      rating: rating,
      date: date,
      image: image
    );
  }
}