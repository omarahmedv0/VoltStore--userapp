import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/assets/icon_assets_manager.dart';
import '../../view_model/home_cubit/home_cubit.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {},
      child: Row(
        children: [
          Text(
            'VOLT',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Spacer(),
          IconButton(
            splashRadius: 1,
            onPressed: () {
              HomeCubit.get(context).toSearchScreen(context);
            },
            icon: Image.asset(
              IconsAssetsManager.search,
              width: 70,
              height: 70,
            ),
          ),
          IconButton(
            splashRadius: 1,
            onPressed: () {
              HomeCubit.get(context).toNotificationsScreen(context);
            },
            icon: Image.asset(IconsAssetsManager.notification),
          ),
        ],
      ),
    );
  }
}
