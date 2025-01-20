import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/features/checkout/presentation/views/widgets/address_input_section.dart';
import 'package:fruits_app/features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:fruits_app/features/checkout/presentation/views/widgets/shipping_section.dart';
import 'package:meta/meta.dart';

import '../../../../cart/domain/entities/cart_item_entity.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.cartItems) : super(CheckoutInitial());
  final List<CartItemEntity>cartItems;
  late PageController pageController;
  late TextEditingController emailController , addressController ,cityController,floorNumber , nameController,phoneController;
  late GlobalKey<FormState> formKey;
  AutovalidateMode? autovalidateMode;
  int currentPageIndex=0;

  init(){
    print(cartItems.length);
    pageController = PageController();
    emailController = TextEditingController();
    addressController = TextEditingController();
    cityController = TextEditingController();
    floorNumber = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    formKey = GlobalKey<FormState>();
    autovalidateMode=AutovalidateMode.disabled;
    pageController.addListener((){
      currentPageIndex=pageController.page!.toInt();
      print('cccccccccccurent${currentPageIndex}');
      emit(ChangeCurrentPageIndex());
    });

    print('init');
    emit(InitState());
  }
  List<Widget> getPages(){
    return [
      ShippingSection(),
      AddressInputSection(),
      PaymentSection(),

    ];
  }
  void changePageBySteps(int pageIndex) {
    pageController.animateToPage(pageIndex, duration: Duration(milliseconds:300), curve: Curves.easeIn);
    emit(ChangeCurrentPageIndex());
  }
  int selectedShippingSection=0;
  void changeSelectedShippingSection(int index){
    selectedShippingSection=index;
    emit(ShippingSectionSelected());
  }
  void printa() {
    print('dsf');
  }
  validateAddressSection(){
    if(formKey.currentState!.validate()){
      goToNextSection();

    }

    else{
      print('Invalid');
    }
  }
  goToNextSection(){
    pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    print(pageController.page);
  }
  goToNextSectionValidate(){
    /*if (pageController.page==1.0) {
      validateAddressSection();
      autovalidateMode=AutovalidateMode.always;
      //changeCurrentPageIndex();
      emit(state);

    } else{
      goToNextSection();
     // changeCurrentPageIndex();

    }*/
    goToNextSection();


  }
  String buttonText(){
    switch (currentPageIndex) {
      case 0:
        return AppString.next;
      case 1:
        return AppString.next;
      case 2:
        return AppString.payWithPaypal;
      default:
        return AppString.next;
    }
  }
  String AppBarText(){
    switch (currentPageIndex) {
      case 0:
        return AppString.shipping;
      case 1:
        return AppString.address;
      case 2:
        return AppString.payment;
      default:
        return AppString.next;
    }

  }



}
