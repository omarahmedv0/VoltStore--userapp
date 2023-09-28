import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../core/functions/navigation/pop.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../../view_model/map_cubit/map_cubit.dart';
import '../../view_model/map_cubit/map_state.dart';
import '../widgets/map/custom_botton_to_address_details.dart';
import '../widgets/map/custom_map_address.dart';
import '../widgets/map/custom_widget_loading_state.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomAppBar(
                    ispadding: true,
                isleading: true,
                  title: '158'.tr,
                  onTap: () {
                   pop(context);
                  },
                ),
              ),
              ConditionalBuilder(
                condition: state is GetDefaultPositionLoading,
                builder: (context) => const CustomWidgetLoadingState(),
                fallback: (context) => const Expanded(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      CustomMapAddress(),
                      CustomBottontoAddressDetails(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
      },
    );
  }
}
