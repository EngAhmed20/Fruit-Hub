import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/features/checkout/data/model/order_model.dart';
import 'package:fruits_app/features/checkout/data/model/order_product_model.dart';
import 'package:fruits_app/features/checkout/data/model/shipping_address_model.dart';


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


List<OrderModel> createDummyOrder() {
  List<OrderModel> orders =[
    OrderModel(
      totalPrice: 150.0,
      paymentMethod: 'عند الاستلام',
      shippingAddressModel: ShippingAddressModel(
        name: 'John Doe',
        email: 'john.doe@example.com',
        address: '123 Main St',
        city: 'Anytown',
        phone: '123-456-7890',
        addressDetails: 'Apt 4B',
      ),
      orderProductModel: [
        OrderProductModel(
          name: 'مانجا ',
          imgUrl: 'https://pekytshuvupspusketqt.supabase.co/storage/v1/object/public/fruits/products/Avocado.png',
          code: 'P001',
          price: 50.0,
          quantity:3,
        ),
        OrderProductModel(
          name: 'خوخ ',
          imgUrl: 'https://pekytshuvupspusketqt.supabase.co/storage/v1/object/public/fruits/products/Avocado.png',
          code: 'P002',
          price: 100.0,
          quantity: 1,
        ),
      ],
      uId: 'order123',
    ),
    OrderModel(
      totalPrice: 150.0,
      paymentMethod: 'عند الاستلام',
      shippingAddressModel: ShippingAddressModel(
        name: 'John Doe',
        email: 'john.doe@example.com',
        address: '123 Main St',
        city: 'Anytown',
        phone: '123-456-7890',
        addressDetails: 'Apt 4B',
      ),
      orderProductModel: [
        OrderProductModel(
          name: 'مانجا ',
          imgUrl: 'https://pekytshuvupspusketqt.supabase.co/storage/v1/object/public/fruits/products/Avocado.png',
          code: 'P001',
          price: 50.0,
          quantity:3,
        ),
        OrderProductModel(
          name: 'خوخ ',
          imgUrl: 'https://pekytshuvupspusketqt.supabase.co/storage/v1/object/public/fruits/products/Avocado.png',
          code: 'P002',
          price: 100.0,
          quantity: 1,
        ),
      ],
      uId: 'order123',
    ),




  ];
  return orders;
}
List<OrderModel> orders =[
  OrderModel(
    totalPrice: 150.0,
    paymentMethod: 'عند الاستلام',
    shippingAddressModel: ShippingAddressModel(
      name: 'John Doe',
      email: 'john.doe@example.com',
      address: '123 Main St',
      city: 'Anytown',
      phone: '123-456-7890',
      addressDetails: 'Apt 4B',
    ),
    orderProductModel: [
      OrderProductModel(
        name: 'مانجا ',
        imgUrl: 'https://pekytshuvupspusketqt.supabase.co/storage/v1/object/public/fruits/products/Avocado.png',
        code: 'P001',
        price: 50.0,
        quantity:3,
      ),
      OrderProductModel(
        name: 'خوخ ',
        imgUrl: 'https://pekytshuvupspusketqt.supabase.co/storage/v1/object/public/fruits/products/Avocado.png',
        code: 'P002',
        price: 100.0,
        quantity: 1,
      ),
    ],
    uId: 'order123',
  ),
  OrderModel(
    totalPrice: 150.0,
    paymentMethod: 'عند الاستلام',
    shippingAddressModel: ShippingAddressModel(
      name: 'John Doe',
      email: 'john.doe@example.com',
      address: '123 Main St',
      city: 'Anytown',
      phone: '123-456-7890',
      addressDetails: 'Apt 4B',
    ),
    orderProductModel: [
      OrderProductModel(
        name: 'مانجا ',
        imgUrl: 'https://pekytshuvupspusketqt.supabase.co/storage/v1/object/public/fruits/products/Avocado.png',
        code: 'P001',
        price: 50.0,
        quantity:3,
      ),
      OrderProductModel(
        name: 'خوخ ',
        imgUrl: 'https://pekytshuvupspusketqt.supabase.co/storage/v1/object/public/fruits/products/Avocado.png',
        code: 'P002',
        price: 100.0,
        quantity: 1,
      ),
    ],
    uId: 'order123',
  ),




];
