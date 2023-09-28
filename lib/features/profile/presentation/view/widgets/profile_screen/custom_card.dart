
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors_manager.dart';

class CustomCard extends StatelessWidget {
   CustomCard({
    super.key,
    required this.text,
        required this.fun,

    this.icon = const Icon(
    Icons.arrow_forward_ios,
  ),
  });
  String text;
  Icon icon;
  Function()? fun;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: fun,
        titleTextStyle: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: ColorsManager.black.withOpacity(0.6)),
        title:  Text(
          text,
        ),
        trailing: icon,
      ),
    );
  }
}
