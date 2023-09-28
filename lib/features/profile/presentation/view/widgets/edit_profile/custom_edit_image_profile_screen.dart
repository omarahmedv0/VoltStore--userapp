import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/api_links.dart';
import '../../../../../../core/constants/colors_manager.dart';
import '../../../../../../core/functions/init_app.dart';
import '../../../view_data/cubit/profile_cubit.dart';

class CustomEditImageProfileScreen extends StatelessWidget {
  const CustomEditImageProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 3.9,
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Center(
                child: Container(
                  width: 170,
                  height: 170,
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: ColorsManager.primary,
                    borderRadius: BorderRadius.circular(360),
                  ),
                  child: Container(
                    width: 170,
                    height: 170,
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: ColorsManager.white,
                      borderRadius: BorderRadius.circular(360),
                    ),
                    child: CircleAvatar(
                      radius: 60.h,
                      backgroundImage:
                          ProfileCubit.get(context).fileImage == null
                              ? NetworkImage(
                                  "${ApiLinks.profileImagesLink}/${sharedPreferences.getString('image')!}",
                                )
                              : FileImage(ProfileCubit.get(context).fileImage!)
                                  as ImageProvider,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: ()async {
                await  ProfileCubit.get(context).chooseImage();
                },
                icon: const Icon(
                  Icons.camera_alt,
                  color: ColorsManager.black,
                  size: 30,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
