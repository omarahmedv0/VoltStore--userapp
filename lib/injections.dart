import 'features/address/presentation/view_model/add_address/add_address_cubit.dart';
import 'features/address/presentation/view_model/address_edit/edit_address_cubit.dart';
import 'features/products_details/data/repos/product_details_repo_impl.dart';

import 'features/profile/data/repo/profile_repo_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'core/class/api/api_service.dart';
import 'features/address/data/repo/address_repo_impl.dart';
import 'features/address/presentation/view_model/address_cubit/address_cubit.dart';
import 'features/address/presentation/view_model/map_cubit/map_cubit.dart';
import 'features/auth/data/repos/login_repo/login_repo_impl.dart';
import 'features/auth/data/repos/signup_repo/signup_repo_impl.dart';
import 'features/auth/view_model/login_cubit/login_cubit.dart';
import 'features/auth/view_model/signup_cubit/signup_cubit.dart';
import 'features/cart/data/repos/cart_repo_impl.dart';
import 'features/cart/presentation/view_data/cubit/cart_cubit.dart';
import 'features/checkout/data/repos/checkout/checkout_repo_impl.dart';
import 'features/checkout/data/repos/payment/payment_repo_impl.dart';
import 'features/checkout/presentation/view_model/checkout_cubit/checkout_cubit.dart';
import 'features/checkout/presentation/view_model/payment_cubit/payment_cubit.dart';
import 'features/favorite/data/repos/favorite_repo_impl.dart';
import 'features/favorite/presentation/view_data/cubit/favorite_cubit.dart';
import 'features/home/data/repos/home_repos_impl.dart';
import 'features/home/view_model/home_cubit/home_cubit.dart';
import 'features/lang/view_model/cubit/language_cubit.dart';
import 'features/layout/view_model/cubit/app_layout_cubit.dart';
import 'features/notifications/data/repo/notifications_repo_impl.dart';
import 'features/notifications/presentation/view_data/cubit/notifications_cubit.dart';
import 'features/onboarding/data/repos/onboarding_repos_impl.dart';
import 'features/onboarding/view_model/cubit/onboarding_cubit.dart';
import 'features/orders/myorders/data/repos/myorders_repo_impl.dart';
import 'features/orders/myorders/presentation/view_data/cubit/myorders_cubit.dart';
import 'features/orders/order_details/data/repo/order_details_repo_impl.dart';
import 'features/orders/order_details/presentation/view_data/cubit/order_details_cubit.dart';
import 'features/orders/orders_received/data/repo/order_received_repo_impl.dart';
import 'features/orders/orders_received/presentation/view_data/cubit/order_received_cubit.dart';
import 'features/products/data/repos/products_repo_impl.dart';
import 'features/products/presentation/view_model/products_cubit/products_cubit.dart';
import 'features/products_details/presentation/view_model/cubit/product_details_cubit.dart';
import 'features/profile/presentation/view_data/cubit/profile_cubit.dart';
import 'features/rating/data/repo/rating_repo_impl.dart';
import 'features/rating/presentation/view_data/myrating_cubit/my_rating_cubit.dart';
import 'features/rating/presentation/view_data/products_reviews_cubit/products_reviews_cubit.dart';
import 'features/rating/presentation/view_data/rating_cubit/rating_cubit.dart';
import 'features/search/data/repos/search_repo_impl.dart';
import 'features/search/presentation/view_model/cubit/search_cubit.dart';

final getIt = GetIt.instance;

void initialInjections() {
// Networking
  getIt.registerSingleton<Client>(Client());

  // API Services
  getIt.registerSingleton<ApiService>(ApiService(
    client: getIt.get<Client>(),
  ));

  // Repos
  getIt.registerSingleton<SignupRepoImpl>(SignupRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<LoginRepoImpl>(LoginRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<ProductsRepoImpl>(ProductsRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<CartRepoImpl>(CartRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<FavoriteRepoImpl>(FavoriteRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<OnboardingReposImpl>(
    OnboardingReposImpl(
      apiService: getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(getIt.get<ApiService>()),
  );
  getIt.registerSingleton<AddressRepoImpl>(
    AddressRepoImpl(getIt.get<ApiService>()),
  );
  getIt.registerSingleton<CheckoutRepoImpl>(
    CheckoutRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<PaymentRepoImpl>(
    PaymentRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<MyordersRepoImpl>(
    MyordersRepoImpl(apiService: getIt.get<ApiService>()),
  );

  getIt.registerSingleton<OrderDetailsRepoImpl>(
    OrderDetailsRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<OrderReceivedRepoImpl>(
    OrderReceivedRepoImpl(apiService: getIt.get<ApiService>()),
  );

  getIt.registerSingleton<NotificationsRepoImpl>(
    NotificationsRepoImpl(apiService: getIt.get<ApiService>()),
  );

  getIt.registerSingleton<RatingRepoImpl>(
    RatingRepoImpl(apiService: getIt.get<ApiService>()),
  );

  getIt.registerSingleton<ProfileRepoImpl>(
    ProfileRepoImpl(apiService: getIt.get<ApiService>()),
  );

  getIt.registerSingleton<ProductDetailsRepoImpl>(
    ProductDetailsRepoImpl(apiService: getIt.get<ApiService>()),
  );

  // BLOC
  getIt.registerFactory<LanguageCubit>(
    () => LanguageCubit(),
  );
  getIt.registerFactory<OnboardingCubit>(
    () => OnboardingCubit(
      getIt.get<OnboardingReposImpl>(),
    ),
  );
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(
      getIt.get<LoginRepoImpl>(),
    ),
  );
  getIt.registerFactory<SignupCubit>(
    () => SignupCubit(
      getIt.get<SignupRepoImpl>(),
    ),
  );
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(
      getIt.get<HomeRepoImpl>(),
    ),
  );
  getIt.registerFactory<ProductsCubit>(
    () => ProductsCubit(
      getIt.get<ProductsRepoImpl>(),
    ),
  );
  getIt.registerFactory<ProductDetailsCubit>(
    () => ProductDetailsCubit(getIt.get<ProductDetailsRepoImpl>()),
  );
  getIt.registerFactory<FavoriteCubit>(
    () => FavoriteCubit(
      getIt.get<FavoriteRepoImpl>(),
    ),
  );
  getIt.registerFactory<CartCubit>(
    () => CartCubit(
      getIt.get<CartRepoImpl>(),
    ),
  );
  getIt.registerFactory<AddAddressCubit>(
    () => AddAddressCubit(
      getIt.get<AddressRepoImpl>(),
    ),
  );
  getIt.registerFactory<AppLayoutCubit>(
    () => AppLayoutCubit(),
  );
  getIt.registerFactory<ProfileCubit>(
    () => ProfileCubit(getIt.get<ProfileRepoImpl>()),
  );
  getIt.registerFactory<SearchCubit>(
    () => SearchCubit(getIt<SearchRepoImpl>()),
  );
  getIt.registerFactory<AddressCubit>(
    () => AddressCubit(getIt<AddressRepoImpl>()),
  );
  getIt.registerFactory<MapCubit>(
    () => MapCubit(),
  );

  getIt.registerFactory<CheckoutCubit>(
    () => CheckoutCubit(getIt.get<CheckoutRepoImpl>()),
  );
  getIt.registerFactory<PaymentCubit>(
    () => PaymentCubit(paymentRepoImpl: getIt.get<PaymentRepoImpl>()),
  );
  getIt.registerFactory<MyordersCubit>(
    () => MyordersCubit(getIt.get<MyordersRepoImpl>()),
  );
  getIt.registerFactory<OrderDetailsCubit>(
    () => OrderDetailsCubit(getIt.get<OrderDetailsRepoImpl>()),
  );
  getIt.registerFactory<OrderReceivedCubit>(
    () => OrderReceivedCubit(getIt.get<OrderReceivedRepoImpl>()),
  );
  getIt.registerFactory<NotificationsCubit>(
    () => NotificationsCubit(getIt.get<NotificationsRepoImpl>()),
  );
  getIt.registerFactory<RatingCubit>(
    () => RatingCubit(getIt.get<RatingRepoImpl>()),
  );

  getIt.registerFactory<MyRatingCubit>(
    () => MyRatingCubit(getIt.get<RatingRepoImpl>()),
  );
  getIt.registerFactory<ProductsReviewsCubit>(
    () => ProductsReviewsCubit(getIt.get<RatingRepoImpl>()),
  );
  getIt.registerFactory<EditAddressCubit>(
    () => EditAddressCubit(getIt.get<AddressRepoImpl>()),
  );
}
