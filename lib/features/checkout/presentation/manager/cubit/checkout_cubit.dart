
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruits_app/core/helper_function/get_user.dart';
import 'package:fruits_app/core/repos/order_repo/order_repo.dart';
import 'package:fruits_app/core/utilis/app_keys.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_app/features/checkout/domain/entities/paypal_entity/Paypal_payment_entity.dart';
import 'package:fruits_app/features/checkout/presentation/views/widgets/address_input_section.dart';
import 'package:fruits_app/features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:fruits_app/features/checkout/presentation/views/widgets/shipping_section.dart';
import 'package:meta/meta.dart';

import '../../../../../constant.dart';
import '../../../../../core/helper_function/getExchangeRate.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../../../cart/domain/entities/cart_entities.dart';
import '../../../domain/entities/shipping_address_entity.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.cartItems, this.orderRepo) : super(CheckoutInitial());
  final CartEntities cartItems;
  final OrderRepo orderRepo;
  late PageController pageController;
  late TextEditingController emailController,
      addressController,
      cityController,
      floorNumber,
      nameController,
      phoneController;
  late GlobalKey<FormState> formKey;
  AutovalidateMode? autovalidateMode;
  late OrderEntity orderEntity;
  late PaypalPaymentEntity paypalPaymentEntity;
  int currentPageIndex = 0;
  double cashOnDeliveryPrice = 0;
  double paypalPaymentPrice = 0;
  ShippingAddressEntity addressEntity = ShippingAddressEntity();

  init() async{
    emit(InitStateLoading());
    orderEntity = OrderEntity(
      cartItems,
      addressEntity,
      getUser().uId,
    );

    totalPrice();
    pageController = PageController();
    emailController = TextEditingController();
    emailController.text=getUser().email;
    addressController = TextEditingController();
    cityController = TextEditingController();
    floorNumber = TextEditingController();
    nameController = TextEditingController();
    nameController.text=getUser().name;
    phoneController = TextEditingController();
    formKey = GlobalKey<FormState>();
    autovalidateMode = AutovalidateMode.disabled;
    pageController.addListener(() {
      currentPageIndex = pageController.page!.toInt();
      print('cccccccccccurent${currentPageIndex}');
      emit(ChangeCurrentPageIndex());
    });
    exchangeRate=await getExchangeDollarRate();
    Future.delayed(Duration(seconds: 1), () {
      // 2 seconds delay
      emit(InitStateSuccess()); // Emit success state after delay
    });
  }

  List<Widget> getPages() {
    return [
      ShippingSection(),
      AddressInputSection(),
      PaymentSection(),
    ];
  }
//////////////////change page using steps
  void changePageBySteps(int pageIndex, BuildContext context) {
    if (pageController.page == 0 && selectedShippingSection == 0) {
      customSnackBar(
          context: context, msg: AppString.pleaseSelectPaymentMethod);
    } else if (pageController.page == 1) {
      validateAddressSection(navigateByButton: false, pageIndex: pageIndex);
    } else {
      orderEntity.payWithCash = payWithCashOrWithPaypal();
      goToNextSection(navigateByButton: false, pageIndex: pageIndex);
    }

    emit(ChangeCurrentPageIndex());
  }

  int selectedShippingSection = 0;
  void changeSelectedShippingSection(int index) {
    selectedShippingSection = index;
    emit(ShippingSectionSelected());
  }
///////////////////////////validate address section
  validateAddressSection({bool? navigateByButton, int? pageIndex}) {
    if (formKey.currentState!.validate()) {
      identifyAddressSection();
      goToNextSection(navigateByButton: navigateByButton, pageIndex: pageIndex);
    } else {
      autovalidateMode = AutovalidateMode.always;
      emit(state);


    }
  }
//navigate after validate
  goToNextSection({bool? navigateByButton, int? pageIndex}) {
    if (navigateByButton == false) {
      pageController.animateToPage(pageIndex!,
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  goToNextSectionValidate(BuildContext context) {
    print('${getUser().uId} user id');
    if (pageController.page == 0 && selectedShippingSection == 0) {
      customSnackBar(
          context: context, msg: AppString.pleaseSelectPaymentMethod);
    } else if (pageController.page == 1.0) {
      validateAddressSection();
      //changeCurrentPageIndex();
      emit(state);
    }else if(pageController.page==2 && orderEntity.payWithCash==false){
      ////pay via paypal and add order to database
      payWithPaypal(context);
      //addOrder(orderEntity: orderEntity);
    }else if(pageController.page==2||orderEntity.payWithCash==true){
      // add order to database pay with cash
      addOrder(orderEntity: orderEntity);
    }

    else {
      orderEntity.payWithCash = payWithCashOrWithPaypal();
      goToNextSection();
    }
    emit(state);
  }

  bool payWithCashOrWithPaypal() {
    if (selectedShippingSection == 1) {
      return true;
    } else {
      return false;
    }
  }

  identifyAddressSection() {
    addressEntity.address = addressController.text;
    addressEntity.city = cityController.text;
    addressEntity.addressDetails = floorNumber.text;
    addressEntity.name = nameController.text;
    addressEntity.phone = phoneController.text;
    addressEntity.email = emailController.text;
    emit(state);
  }

  String buttonText() {
    switch (currentPageIndex) {
      case 0:
        return AppString.next;
      case 1:
        return AppString.next;
      case 2:
        if(orderEntity.payWithCash==false) {
          return AppString.payWithPaypal;
        }
        else{
          return AppString.productOrder;
        }
      default:
        return AppString.next;
    }
  }

  String AppBarText() {
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

  totalPrice() {
    cashOnDeliveryPrice =
        orderEntity.cartItems.calculateTotalPrice() + deliveryCost;
    paypalPaymentPrice = orderEntity.cartItems.calculateTotalPrice();
  }
  //////////////////////////////add order to firestore
  addOrder({required OrderEntity orderEntity})async{
    emit(AddOrderLoadingState());
    var result=await orderRepo.addOrder(orderEntity: orderEntity);
    result.fold((failure)=>emit(AddOrderFailureState(failure.message)), (success)=>emit(AddOrderSuccess()));

  }
  /////////////paypal and add order to firebase
  payWithPaypal(BuildContext context){
    paypalPaymentEntity=PaypalPaymentEntity.fromEntity(orderEntity);
   // emit(PaypalPaymentLoadingState());
    log(paypalPaymentEntity.toJson(exchangeRate: exchangeRate).toString());
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: KPaypalClientId,
        secretKey: KPaypalSecretKey,
        transactions:  [
         paypalPaymentEntity.toJson(exchangeRate: exchangeRate)

        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          print("onSuccess: $params");
          Navigator.pop(context);
          addOrder(orderEntity: orderEntity);
          emit(PaypalPaymentSuccessState());


        },
        onError: (error) {
          log(error.toString());
          print(error);
          Navigator.pop(context);
          emit(PaypalPaymentFailureState(error.toString()));
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ));
  }
  /////////////////////////////paymob


}
