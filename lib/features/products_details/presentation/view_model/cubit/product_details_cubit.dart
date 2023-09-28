// ignore_for_file: avoid_print
import 'package:e_commerce_app/core/constants/route_manager.dart';
import 'package:e_commerce_app/core/functions/navigation/to_named.dart';
import 'package:e_commerce_app/features/products_details/data/repos/product_details_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/products.dart';
import '../../../../layout/view_model/cubit/app_layout_cubit.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.productDetailsRepoImpl)
      : super(ProductDetailsInitial());
  static ProductDetailsCubit get(context) {
    return BlocProvider.of(context);
  }

  ProductDetailsRepoImpl productDetailsRepoImpl;
  Products? productDetails;
  initialData(context) async {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    productDetails = arguments['productsDetails'];
  }

  int? sizeSelectedIndex;
  String? sizeSelectedName;

  changeCurrentSize(int index) {
    sizeSelectedIndex = index;
    sizeSelectedName = productSize[sizeSelectedIndex!];
    emit(ChangeSizeSelected());
  }

  int? colorSelectedIndex;
  String? colorSelectedName;
  changeCurrentColor(int index) {
    colorSelectedIndex = index;
    colorSelectedName = productColors[colorSelectedIndex!];
    emit(ChangeColorSelected());
  }

  List<String> productColors = [];
  List<String> productSize = [];



  Future<void> getProductColors(String id) async {
    emit(GetProductColorLoading());
    var response = await productDetailsRepoImpl.getProductColor(id);
    response.fold((failure) {
      emit(GetProductColorFailere());
    }, (data) {
      productColors = data.data!;
      emit(GetProductColorSuccess());
    });
  }

  Future<void> getProductSize(String id) async {
    emit(GetProductSizeLoading());
    var response = await productDetailsRepoImpl.getProductSize(id);
    response.fold((failure) {
      emit(GetProductSizeFailere());
    }, (data) {
      productSize = data.data!;
      emit(GetProductSizeSuccess());
    });
  }

  toCartScreen(context) {
    toNamed(
      context,
      RouteManager.layout,
    );
    AppLayoutCubit.get(context).currentPage = 2;
  }

  toSeeAllReviews(context, Products productReview) {
    toNamed(context, RouteManager.productsReviews, arguments: {
      'productReview': productReview,
    });
  }


}
