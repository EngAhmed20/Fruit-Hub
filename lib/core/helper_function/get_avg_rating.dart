import 'package:fruits_app/core/models/review_model.dart';

import '../entities/review_entity.dart';

num getAvgRating(List<ReviewModel>reviews) {
  var sum=0.0;
  for(var review in reviews){
    sum+=review.rating;
  }
  return sum/reviews.length;
}

