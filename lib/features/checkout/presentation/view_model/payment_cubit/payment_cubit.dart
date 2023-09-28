// ignore_for_file: unrelated_type_equality_checks

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_commerce_app/core/functions/custom_snack_bar.dart';
import 'package:e_commerce_app/features/checkout/data/repos/payment/payment_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentRepoImpl paymentRepoImpl;
  PaymentCubit({required this.paymentRepoImpl}) : super(PaymentInitial());

  static PaymentCubit get(context) {
    return BlocProvider.of(context);
  }

  String? clientSecretKey;
  Future<void> _getClientSecretKey(int amount, String currency) async {
    emit(GetClientKeyLoading());
    var response = await paymentRepoImpl.getClintSecretKey(
      (amount * 100).toString(),
      currency,
    );
    response.fold((failere) {
      emit(GetClientKeyFailere());
    }, (clientKey) {
      clientSecretKey = clientKey['client_secret'];
      emit(GetClientKeySuccess());
    });
  }

  Future<void> makePayment(int amount, String currency, context) async {
    try {
      emit(PayLoading());
      await _getClientSecretKey(amount, currency);
      await _initializePaymentSheet(clientSecretKey!);
      try {
        await Stripe.instance.presentPaymentSheet();
      } on StripeException catch (e) {
        if (e.error.code == FailureCode.Canceled) {
          customSnackBar(context, 'Canceled', AnimatedSnackBarType.error, 200);
        } else {
          customSnackBar(context, 'error', AnimatedSnackBarType.error, 200);
        }
      }
      emit(PaySuccess());
    } on StripeException {
      customSnackBar(context, 'error', AnimatedSnackBarType.error, 200);
      emit(PayFailere());
    }
  }
}

Future<void> _initializePaymentSheet(String clientSecret) async {
  await Stripe.instance.initPaymentSheet(
    paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: clientSecret,
      merchantDisplayName: "test",
    ),
  );
}
