// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/class/api/api_service.dart';
import 'package:e_commerce_app/core/class/api/failures.dart';
import 'package:e_commerce_app/core/constants/api_links.dart';

import '../model/onboarding_model.dart';
import 'onboarding_repos.dart';

class OnboardingReposImpl implements OnboardingRepos {
  ApiService apiService;
  OnboardingReposImpl({
    required this.apiService,
  });
  @override
  Future<Either<Failure, OnboardingModel>> getOnboardingData() async {
    try {
      var response = await apiService.getData(ApiLinks.getOnboardingData,);
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(OnboardingModel.fromJson(data));
      });
    } on Failure catch (e) {
      return left(e);
    }
  }
}
