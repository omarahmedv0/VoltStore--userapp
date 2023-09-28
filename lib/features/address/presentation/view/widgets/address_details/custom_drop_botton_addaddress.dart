import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/colors_manager.dart';
import '../../../../../../core/functions/language/initial_language.dart';
import '../../../view_model/add_address/add_address_cubit.dart';

class CustomDropBottonAddAddress extends StatelessWidget {
  const CustomDropBottonAddAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAddressCubit, AddAddressState>(
      builder: (context, state) {
        var cubit = AddAddressCubit.get(context);
        return Container(
          decoration: BoxDecoration(
              color: ColorsManager.grey.withOpacity(.2),
              borderRadius: BorderRadius.circular(180)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                lange == 'en' ? 'Select your City' : 'اختر محافظتك',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: cubit.citiesData
                  .map((item) => DropdownMenuItem<String>(
                        value:
                            lange == 'en' ? item.cityNameEn : item.cityNameAr,
                        child: Text(
                          lange == 'en' ? item.cityNameEn! : item.cityNameAr!,
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: ColorsManager.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ))
                  .toList(),
              value: cubit.citySelected,
              onChanged: (String? value) {
                cubit.onCityChanged(value);
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                height: 40,
                width: 140,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
            ),
          ),
        );
      },
    );
  }
}
