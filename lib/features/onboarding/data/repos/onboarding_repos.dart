import 'package:dartz/dartz.dart';

import '../../../../core/class/api/failures.dart';
import '../model/onboarding_model.dart';

abstract class OnboardingRepos {
   Future<Either<Failure,OnboardingModel>> getOnboardingData();
}