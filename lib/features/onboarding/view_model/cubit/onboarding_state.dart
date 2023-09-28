part of 'onboarding_cubit.dart';

@immutable
abstract class OnboardingState {}

class OnboardingInitial extends OnboardingState {}

class GetOnboardingDataLoading extends OnboardingState {}

class GetOnboardingDataSuccess extends OnboardingState {}

class GetOnboardingDataFailure extends OnboardingState {}

class OnboardingPageChanged extends OnboardingState {}

