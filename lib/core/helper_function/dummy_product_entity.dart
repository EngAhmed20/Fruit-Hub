import 'package:fruits_app/core/entities/product_entity.dart';

ProductEntity dummyProduct = ProductEntity(
    name: "افوكادو",
    code: "AM123",
    quantity: 50,
    description: "A healthy and organic almond milk alternative.",
    price: 5.99,
    isFeatured: true,
    imageUrl:
        "https://pekytshuvupspusketqt.supabase.co/storage/v1/object/public/fruits/products/Avocado.png",
    expirationMonths: 12,
    isOrganic: true,
    numOfCalories: 30,
    avgRating: 4.2,
    ratingCount: 10,
    unitAmount: 1,
    sellingCount: 100,
    reviews: []);

List<ProductEntity> dummyProductList = [
  dummyProduct,
  dummyProduct,
  dummyProduct,
  dummyProduct,
  dummyProduct,
  dummyProduct,
  dummyProduct,
  dummyProduct,
];
