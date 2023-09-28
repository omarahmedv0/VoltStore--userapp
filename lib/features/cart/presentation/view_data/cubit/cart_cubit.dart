import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/class/api/api_errors.dart';
import '../../../../../core/constants/route_manager.dart';
import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/init_app.dart';
import '../../../../../core/functions/navigation/to_named.dart';
import '../../../data/models/cart/cart_model.dart';
import '../../../data/repos/cart_repo_impl.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartRepoImpl) : super(CartInitial());
  final CartRepoImpl _cartRepoImpl;
  static CartCubit get(context) {
    return BlocProvider.of(context);
  }

  TextEditingController couponController = TextEditingController();

  int quantity = 1;
  addQuantity() {
    quantity++;
    emit(Update());
  }

  deleteQuantity() {
    if (quantity == 1) {
    } else {
      quantity--;
    }
    emit(Update());
  }

  Future<void> addCart(
      String productId, String color, String size, context) async {
    var response = await _cartRepoImpl.addCart(
      productId,
      sharedPreferences.getString("userID")!,
      quantity.toString(),
      color,
      size,
    );
    if (response['status'] == 'success') {
      await getCartData();
      emit(AddedCartSuccessfully());
    } else {
      emit(AddedCartFailere());
    }
  }

  Future<void> decreaseQuaintity(
      productId, String color, String size, context) async {
    emit(DecreaseQuantityLoading());

    var response = await _cartRepoImpl.decreaseQuantity(
      productId,
      sharedPreferences.getString("userID")!,
      color,
      size,
    );
    if (response['status'] == 'success') {
      await getCartData();
      emit(DecreaseQuantitySuccess());
    } else {
      emit(DecreaseQuantityFailere());
    }
  }

  Future<void> increaseQuantity(
      productId, String color, String size, context) async {
    emit(IncreaseQuantityLoading());

    var response = await _cartRepoImpl.increaseQuantity(
      productId,
      sharedPreferences.getString("userID")!,
      color,
      size,
    );
    if (response['status'] == 'success') {
      await getCartData();
      emit(IncreaseQuantitySuccess());
    } else {
      emit(IncreaseQuantityFailere());
    }
  }

  Future<void> deleteCart(productId, String color, String size, context) async {
    var response = await _cartRepoImpl.deleteCart(
      productId,
      sharedPreferences.getString("userID")!,
      color,
      size,
    );
    if (response['status'] == 'success') {
      await getCartData();
      emit(DeletedCartSuccessfully());
    } else {
      emit(DeletedCartFailere());
    }
  }

  CartModel cartModel = CartModel();
  getCartData() async {
    emit(GetCartDataLoading());
    var response = await _cartRepoImpl.getCartData(
      sharedPreferences.getString("userID")!,
    );
    response.fold((failere) {
      emit(GetCartDataFailere(failere.errMessage, failere.apiErrors));
    }, (cartdata) {
      cartModel = cartdata;
      emit(GetCartDataSuccess());
    });
  }

  int? coupon = 0;
  int discountCalculation() {
    return (int.parse(cartModel.data.cartData.subCartprice) *
            (coupon! / 100))
        .toInt();
  }

  int sumTotalCart() {
    return (int.parse(cartModel.data.cartData.subCartprice) -
        discountCalculation());
  }

  String? couponID;
  checkCoupon(context) async {
    if (couponController.text.isEmpty) {
      customSnackBar(
        context,
        'Please enter promo code',
        AnimatedSnackBarType.info,
        30,
      );
    } else {
      emit(CheckCouponLoading());
      var response = await _cartRepoImpl.checkCoupon(
        couponController.text,
      );
      response.fold((failere) {
        if (failere.apiErrors == ApiErrors.couponisnotValid) {
          customSnackBar(
            context,
            'Coupon is not valid',
            AnimatedSnackBarType.error,
            30,
          );
          couponID = '0';
          coupon = 0;
        }
        emit(CheckCouponFailere());
      }, (data) {
        couponID = data.data![0].couponId;
        coupon = int.parse(
          data.data![0].couponDiscount!,
        );
        emit(CheckCouponSuccess());
      });
    }
  }

  removeCoupon() {
    couponController.text = '';
    coupon = 0;
    couponID = '0';
    emit(RemoveCouponSuccess());
  }

  toCheckoutScreen(
    context,
    String subPrice,
    String discount,
    String cartCount,
  ) {
    toNamed(context, RouteManager.checkout, arguments: {
      'subPrice': subPrice,
      'discount': discount,
      'cartCount': cartCount,
      'cartProductsData': cartModel,
      'couponID': couponID,
    });
  }
}
