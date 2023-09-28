
import 'features/products_details/presentation/view_model/cubit/product_details_cubit.dart';

import 'features/orders/order_details/presentation/view_data/cubit/order_details_cubit.dart';
import 'features/rating/presentation/view_data/myrating_cubit/my_rating_cubit.dart';
import 'features/rating/presentation/view_data/products_reviews_cubit/products_reviews_cubit.dart';
import 'features/rating/presentation/view_data/rating_cubit/rating_cubit.dart';

import 'features/cart/presentation/view_data/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/functions/init_app.dart';
import 'core/functions/initial_route.dart';
import 'core/functions/language/initial_language.dart';
import 'core/localization/translations.dart';
import 'features/address/presentation/view_model/address_cubit/address_cubit.dart';
import 'features/auth/view_model/login_cubit/login_cubit.dart';
import 'features/auth/view_model/signup_cubit/signup_cubit.dart';
import 'features/favorite/presentation/view_data/cubit/favorite_cubit.dart';
import 'features/home/view_model/home_cubit/home_cubit.dart';
import 'features/lang/view_model/cubit/language_cubit.dart';
import 'features/layout/view_model/cubit/app_layout_cubit.dart';
import 'features/onboarding/view_model/cubit/onboarding_cubit.dart';
import 'injections.dart';
import 'routes.dart';
import 'themes/theme_manager.dart';

void main(context) async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  initialInjections();
     
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt.get<LoginCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt.get<SignupCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt.get<LanguageCubit>(),
            ),
            BlocProvider(
              create: (context) =>
                  getIt.get<OnboardingCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt.get<AppLayoutCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt.get<HomeCubit>()..getHomeData(context),
            ),
            BlocProvider(
              create: (context) =>
                  getIt.get<FavoriteCubit>()..getFavoriteData(),
            ),
            BlocProvider(
              create: (context) => getIt.get<CartCubit>()..getCartData(),
            ),
            BlocProvider(
              create: (context) => getIt.get<AddressCubit>()..getAddressData(),
            ),
            BlocProvider(
              create: (context) =>
                  getIt.get<OrderDetailsCubit>(),
            ),
            BlocProvider(
              create: (context) =>
                  getIt.get<ProductsReviewsCubit>(),
            ),
            BlocProvider(
              create: (context) =>
                  getIt.get<MyRatingCubit>(),
            ),
             BlocProvider(
              create: (context) =>
                  getIt.get<RatingCubit>(),
            ),
             BlocProvider(
              create: (context) =>
                  getIt.get<ProductDetailsCubit>(),
            ),
              
          ],

   
          child: GetMaterialApp(
            initialRoute: initialRoute(),
            routes: routes,
            locale: language,
            translations: MyTranslations(),
            debugShowCheckedModeBanner: false,
            theme: lange == 'ar'
                ? ThemeManager.arabicTheme
                : ThemeManager.englishTheme,
          ),
        );
      },
    );
  }
}
