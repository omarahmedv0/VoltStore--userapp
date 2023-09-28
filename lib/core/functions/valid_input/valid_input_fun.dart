// ignore_for_file: unused_element

import 'package:get/get.dart';

import 'is_email.dart';
import 'is_phone.dart';


validInputFun(String? val, int min, int max, String type) {
  
 

  if (type == 'username') {
    if (val!.isEmpty) {
      return '65'.tr;
    } else {
      if (val.length < min) {
        return '${'58'.tr}$min';
      } else if (val.length > max) {
        return '${'62'.tr}$max';
      }
    }
  }


  if (type == 'email') {
    if (val!.isEmpty) {
      return '66'.tr;
    } else {
      if (isEmail(val)) {
        if (val.length < min) {
          return '${'57'.tr}$min';
        } else if (val.length > max) {
          return '${'61'.tr}$max';
        }
      } else {
        return '54'.tr;
      }
    }
  }

  if (type == 'phone') {
    if (val!.isEmpty) {
      return '68'.tr;
    } else {
      if (isPhoneNoValid(val)) {
        if (val.length < min) {
          return '${'59'.tr}$min';
        } else if (val.length > max) {
          return '${"63".tr}$max';
        }
      } else {
        return '56'.tr;
      }
    }
  }

  if (type == 'password') {
    if (val!.isEmpty) {
      return '67'.tr;
    } else {
      if (val.length < min) {
        return '${'60'.tr}$min';
      } else if (val.length > max) {
        return '${'64'.tr}$max';
      }
    }
  }
}
