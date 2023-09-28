import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/route_manager.dart';
import '../../../../../core/functions/init_app.dart';
import '../../../../../core/functions/navigation/to_named.dart';
import '../../../../../core/functions/upload_image.dart';
import '../../../../auth/data/model/user_model/user_model.dart';
import '../../../../layout/view_model/cubit/app_layout_cubit.dart';
import '../../../../rating/presentation/view_data/myrating_cubit/my_rating_cubit.dart';
import '../../../data/repo/profile_repo_impl.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepoImpl) : super(ProfileInitial());
  static ProfileCubit get(context) {
    return BlocProvider.of(context);
  }

  ProfileRepoImpl profileRepoImpl;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  initialData() {
    nameController.text = sharedPreferences.getString('username')!;
    phoneController.text = sharedPreferences.getString('phone')!;
    emailController.text = sharedPreferences.getString('email')!;
    passwordController.text = sharedPreferences.getString('password')!;
  }

  File? fileImage;
  Future chooseImage() async {
    fileImage = await uploadImage();
    emit(UploadImage());
  }
sadas(){
  emit(UploadImage());
}
  UserModel? userModel;
  editProfile(context) async {
    emit(EditProfileLoading());
    if (formKey.currentState!.validate()) {
      var res = await profileRepoImpl.editProfile(
        sharedPreferences.getString('userID')!,
        nameController.text,
        emailController.text,
        phoneController.text,
        passwordController.text,
        sharedPreferences.getString('image')!,
        file: fileImage,
      );
      res.fold((error) {
        emit(EditProfileFailere());
      }, (data) {
        userModel = data;
        sharedPreferences.setString('username', data.data!.userName!);
        sharedPreferences.setString('phone', data.data!.userPhone!);
        sharedPreferences.setString('email', data.data!.userEmail!);
        sharedPreferences.setString('password', data.data!.userPassword!);
        sharedPreferences.setString('image', data.data!.userImage!);
        toNamed(context, RouteManager.layout);
        AppLayoutCubit.get(context).currentPage = 3;
        emit(EditProfileSuccess());
      });
    }
  }

  logout(context) {
    FirebaseMessaging.instance.unsubscribeFromTopic('users');
    FirebaseMessaging.instance
        .unsubscribeFromTopic('user${sharedPreferences.getString('userID')}');
    sharedPreferences.clear();
    toNamed(context, RouteManager.login);
    emit(LogoutState());
  }

  toAddressScreen(context) {
    toNamed(context, RouteManager.address);
  }

  toEditProfile(context) {
    toNamed(context, RouteManager.editProfile);
  }

  toMyorders(context) async {
    toNamed(context, RouteManager.myorders);
  }

  toOrdersReceived(context) {
    toNamed(context, RouteManager.orderReceived);
  }

  toMyrating(context) {
    MyRatingCubit.get(context).getMyratingData();
    toNamed(context, RouteManager.myrating);
  }
}
