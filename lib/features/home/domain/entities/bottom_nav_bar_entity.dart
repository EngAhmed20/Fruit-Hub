import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/generated/assets.dart';

class BottomNavBarEntity{
  final String activeImg;
  final String inactiveImg;
  final String title;
  const BottomNavBarEntity({required this.activeImg, required this.inactiveImg, required this.title});
}
List<BottomNavBarEntity>BottomNavBarEntityList=[
  BottomNavBarEntity(activeImg: Assets.imagesActiveHome, inactiveImg: Assets.imagesHome, title: AppString.home),
  BottomNavBarEntity(activeImg: Assets.imagesActiveProducts, inactiveImg:Assets.imagesProduct, title:AppString.productTitle),
  BottomNavBarEntity(activeImg: Assets.imagesActiveShoppingCart, inactiveImg:Assets.imagesShoppingCart, title:AppString.cart),
  BottomNavBarEntity(activeImg: Assets.imagesActiveUser, inactiveImg:Assets.imagesUser, title:AppString.user)





];