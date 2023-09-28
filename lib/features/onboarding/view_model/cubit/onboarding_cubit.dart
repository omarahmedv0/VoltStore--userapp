// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/route_manager.dart';
import '../../../../core/functions/init_app.dart';
import '../../../../core/functions/navigation/to_named_and_remove_until.dart';
import '../../data/model/onboarding_model.dart';
import '../../data/repos/onboarding_repos_impl.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(this._onboardingReposImpl) : super(OnboardingInitial());

  final OnboardingReposImpl _onboardingReposImpl;
  PageController pageController = PageController();
  static OnboardingCubit get(context) {
    return BlocProvider.of(context);
  }

  int currentPage = 0;
  OnboardingModel? onboardingData;
  Future<void> getOnboardingData() async {
    emit(GetOnboardingDataLoading());
    var res = await _onboardingReposImpl.getOnboardingData();
    res.fold((failere) {
      emit(GetOnboardingDataFailure());
    }, (data) {
      onboardingData = data;
      emit(GetOnboardingDataSuccess());
    });
  }

  next(context) {
    currentPage++;
    if (currentPage > onboardingData!.data!.length - 1) {
      goToLoginScreen(context);
    } else {
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToLoginScreen(context) {
    sharedPreferences.setBool('onboarding', true);
    toNamedandRemoveUntil(context, RouteManager.login);
  }

  onPageChanged(int index) {
    currentPage = index;
    emit(OnboardingPageChanged());
  }
}
