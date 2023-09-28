import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/route_manager.dart';
import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/init_app.dart';
import '../../../../../core/functions/navigation/to_named_and_remove_until.dart';
import '../../../../cart/data/models/cart/cart_model.dart';
import '../../../data/repos/checkout/checkout_repo_impl.dart';
import '../payment_cubit/payment_cubit.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.checkoutRepoImpl) : super(CheckoutInitial());
  CheckoutRepoImpl checkoutRepoImpl;
  static CheckoutCubit get(context) {
    return BlocProvider.of(context);
  }

  String? subPrice;
  String? cartCount;
  String? discount;
  String? couponID;

  CartModel cartProducts = CartModel();
  initialData(context) {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    subPrice = arguments['subPrice'];
    discount = arguments['discount'];
    cartCount = arguments['cartCount'];
    cartProducts = arguments['cartProductsData'];
    couponID = arguments['couponID'];
  }

 String sumTotalPrice() {
   return ((int.parse(subPrice!) - int.parse(discount!)) + int.parse(shippingCost)).toString();
  }

  String? paymentMethod;
  selectPaymentMethod(String paymentWay) {
    paymentMethod = paymentWay;
    emit(SelectPaymentMethod());
  }

  String? addressSelected;

  selectAddress(String addressID, String cityID) {
    addressSelected = addressID;
    emit(SelectAddress());
  }

  String shippingCost = '0';
  Future<void> getShippingCost(context, String cityID) async {
    emit(GetShippingCostLoading());
    var response = await checkoutRepoImpl.getShippingCost(cityID);
    response.fold((failure) {
      emit(GetShippingCostFailere());
    }, (data) {
      shippingCost = data.data!.shippingCost!;
      print(shippingCost);
      emit(GetShippingCostSuccess());
    });
  }

  Future<void> checkout(context) async {
    emit(CheckoutLoading());
    var response = await checkoutRepoImpl.checkout(
      addressSelected!,
      sharedPreferences.getString("userID")!,
      couponID ?? '0',
      subPrice!,
      discount!,
      shippingCost,
      paymentMethod!,
    );
    response.fold((failure) {
      customSnackBar(
        context,
        '170'.tr,
        AnimatedSnackBarType.error,
        200,
      );
      emit(CheckoutFailere());
    }, (success) {
      toNamedandRemoveUntil(
        context,
        RouteManager.myorders,
      );
      customSnackBar(
        context,
        '169'.tr,
        AnimatedSnackBarType.success,
        200,
      );
      emit(CheckoutSuccess());
    });
  }

  placeanOrder(context) async {
    if (addressSelected == null) {
      return customSnackBar(
        context,
        '167'.tr,
        AnimatedSnackBarType.info,
        200,
      );
    } else if (paymentMethod == null) {
      return customSnackBar(
        context,
        '168'.tr,
        AnimatedSnackBarType.info,
        200,
      );
    } else {
      if (CheckoutCubit.get(context).paymentMethod == 'card') {
        await PaymentCubit.get(context)
            .makePayment(
          int.parse(
           sumTotalPrice(),
          ),
          "USD",
          context,
        )
            .then((value) {
          if (state is PaySuccess) {
            checkout(context);
          }
        });
      } else {
        checkout(context);
      }
    }
  }
}
