import 'features/address/presentation/view_model/add_address/add_address_cubit.dart';
import 'features/address/presentation/view_model/address_edit/edit_address_cubit.dart';
import 'features/profile/presentation/view/screens/edit_profile_screen.dart';
import 'features/profile/presentation/view_data/cubit/profile_cubit.dart';
import 'features/notifications/presentation/view/screens/notifications_screen.dart';
import 'features/notifications/presentation/view_data/cubit/notifications_cubit.dart';
import 'features/orders/myorders/presentation/view/screens/myorders_screen.dart';
import 'features/orders/myorders/presentation/view_data/cubit/myorders_cubit.dart';
import 'features/orders/order_details/presentation/view/screens/order_details_screen.dart';
import 'features/orders/orders_received/presentation/view/screens/orders_received_screen.dart';
import 'features/orders/orders_received/presentation/view_data/cubit/order_received_cubit.dart';
import 'features/rating/presentation/view/screens/myrating_screen.dart';
import 'features/rating/presentation/view/screens/products_reviews_screen.dart';
import 'features/rating/presentation/view_data/rating_cubit/rating_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/route_manager.dart';
import 'core/functions/init_app.dart';
import 'features/address/presentation/view/screens/add_address_details_screen.dart';
import 'features/address/presentation/view/screens/address_screen.dart';
import 'features/address/presentation/view/screens/edit_address_screen.dart';
import 'features/address/presentation/view/screens/map_screen.dart';
import 'features/address/presentation/view_model/address_cubit/address_cubit.dart';
import 'features/address/presentation/view_model/map_cubit/map_cubit.dart';
import 'features/auth/view/screens/login/login_screen.dart';
import 'features/auth/view/screens/signup/signup_screen.dart';
import 'features/cart/presentation/view/screens/cart_screen.dart';
import 'features/checkout/presentation/view/screens/checkout_screen.dart';
import 'features/checkout/presentation/view_model/checkout_cubit/checkout_cubit.dart';
import 'features/checkout/presentation/view_model/payment_cubit/payment_cubit.dart';
import 'features/home/view/screens/home_screen.dart';
import 'features/lang/view/screens/lang_screen.dart';
import 'features/layout/view/screens/applayout_screen.dart';
import 'features/onboarding/view/screens/onboarding_screen.dart';
import 'features/products/presentation/view/screens/products_screen.dart';
import 'features/products/presentation/view_model/products_cubit/products_cubit.dart';
import 'features/products_details/presentation/view/screens/products_details_screen.dart';
import 'features/search/presentation/view/screens/search_screen.dart';
import 'features/search/presentation/view_model/cubit/search_cubit.dart';
import 'injections.dart';

Map<String, Widget Function(BuildContext)> routes = {
  RouteManager.address: (c) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt.get<AddressCubit>()..getAddressData(),
          ),
        ],
        child: const AddressScreen(),
      ),
  RouteManager.mapAddress: (c) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                getIt.get<MapCubit>()..getDefaultLocation(context),
          ),
        ],
        child: const MapScreen(),
      ),
  RouteManager.addAddressDetails: (c) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt.get<AddAddressCubit>()..getCities(),
          ),
        ],
        child: const AddAddressDetails(),
      ),
  RouteManager.addressEdit: (c) => BlocProvider(
        create: (context) => getIt.get<EditAddressCubit>()..getCities(),
        child: const EditAddressScreen(),
      ),
  RouteManager.checkout: (c) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt.get<CheckoutCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt.get<PaymentCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt.get<AddressCubit>()
              ..getCities()
              ..getAddressData(),
          ),
        ],
        child: const CheckoutScreen(),
      ),
  RouteManager.productsDetails: (c) => const ProductDetailsScreen(),
  RouteManager.cart: (c) => const CartScreen(),
  RouteManager.search: (c) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt.get<ProductsCubit>()
              ..getProductsData(
                '1',
                sharedPreferences.getString('userID')!,
                context,
              ),
          ),
          BlocProvider(
            create: (context) => getIt.get<SearchCubit>(),
          ),
        ],
        child: const SearchScreen(),
      ),
  RouteManager.products: (context) => BlocProvider(
        create: (context) => getIt.get<ProductsCubit>()..initialData(context),
        child: const ProductsScreen(),
      ),
  RouteManager.signup: (c) => const SignUpScreen(),
  RouteManager.login: (c) => const LoginScreen(),
  RouteManager.productsReviews: (c) => const ProductsReviewsScreen(),
  RouteManager.editProfile: (c) => BlocProvider(
        create: (context) => getIt.get<ProfileCubit>()..initialData(),
        child: const EditProfileScreen(),
      ),
  RouteManager.notifications: (c) => BlocProvider(
        create: (context) =>
            getIt.get<NotificationsCubit>()..getNotifications(context),
        child: const NotificationsScreen(),
      ),
  RouteManager.home: (c) => const HomeScreen(),
  RouteManager.lang: (c) => const LangScreen(),
  RouteManager.layout: (c) => const AppLayout(),
  RouteManager.myrating: (c) => const MyratingScreen(),
  RouteManager.onboarding: (c) => const OnboardingScreen(),
  RouteManager.myorders: (c) => BlocProvider(
        create: (context) => getIt.get<MyordersCubit>()..getOrdersData(context),
        child: const MyordersScreen(),
      ),
  RouteManager.orderDetails: (c) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt.get<RatingCubit>(),
          ),
        ],
        child: const OrderDetailsScreen(),
      ),
  RouteManager.orderReceived: (c) => BlocProvider(
        create: (context) =>
            getIt.get<OrderReceivedCubit>()..getOrdersReceivedData(context),
        child: const OrdersReceivedScreen(),
      ),
};
