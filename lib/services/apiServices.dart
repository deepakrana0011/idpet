import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dog_app/constants/api_constants.dart';
import 'package:dog_app/helper/shared_pref.dart';
import 'package:dog_app/locator.dart';
import 'package:dog_app/model/editProfileResponse.dart';
import 'package:dog_app/model/forgot_password.dart';
import 'package:dog_app/model/getUserResponse.dart';
import 'package:dog_app/model/loginResponse.dart';
import 'package:dog_app/model/resetPasswordResponse.dart';
import 'package:dog_app/model/signupResponse.dart';
import 'package:dog_app/model/verifyCodeResponse.dart';
import 'package:dog_app/model/verify_otp_pswdResponse.dart';
import 'package:dog_app/services/fetchException.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  Dio dio = locator<Dio>();

  Future<LoginResponse> login(String email, String password) async {
    try {
      var map = {"email": email, "password": password};
      var response =
          await dio.post(ApiConstant.BASE_URL + ApiConstant.LOGIN, data: map);
      return LoginResponse.fromJson(json.decode(response.toString()));
    } on DioError catch (e) {
      if (e.response != null) {
        var errorData = jsonDecode(e.response.toString());
        var errorMessage = errorData["message"];
        throw FetchDataException(errorMessage);
      } else {
        throw SocketException("");
      }
    }
  }

  Future<SignupResponse> signUp(
      String dogName,
      String dogSex,
      String dogBreed,
      String ownerName,
      String description,
      String ownerSurname,
      String address,
      String contactPhone,
      String whatsapp,
      String email,
      String password,
      String veterinaryNumber,
      int dogBirthDate,
      File imageFile,
      File bannerImage) async {
    try {
      var map = <String, dynamic>{
        "email": email,
        "password": password,
        "dogName": dogName,
        "dogBreed": dogBreed,
        "dogSex": dogSex,
        "ownerSurname": ownerSurname,
        "description":description,
        "ownerName": ownerName,
        "address": address,
        "contactPhone": contactPhone,
        "whatsapp": whatsapp,
        "veterinaryNumber": veterinaryNumber,
        "dogBirthDate": dogBirthDate,
      };
      if (imageFile != null) {
        var picture =
            MultipartFile.fromFileSync(imageFile.path, filename: "image.png");
        var imageMap = {
          'image': picture,
        };
        map.addAll(imageMap);
      }
      if (bannerImage != null) {
        var bpicture =
            MultipartFile.fromFileSync(bannerImage.path, filename: "image.png");
        var imageMap = {
          'bannerImage': bpicture,
        };
        map.addAll(imageMap);
      }
      var response = await dio.post(ApiConstant.BASE_URL + ApiConstant.SIGNUP, data: FormData.fromMap(map));
      return SignupResponse.fromJson(json.decode(response.toString()));
    } on DioError catch (e) {
      if (e.response != null) {
        var errorData = jsonDecode(e.response.toString());
        var errorMessage = errorData["message".tr()];
        throw FetchDataException(errorMessage);
      } else {
        throw SocketException("");
      }
    }
  }

  Future<GetDetailsResponse> getDeatils() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var headerMap = {
        "Content-Type": "application/json",
        "Authorization": SharedPref.prefs?.getString(SharedPref.JWTTOKEN),
      };
      var options =
          BaseOptions(baseUrl: ApiConstant.BASE_URL, headers: headerMap);
      dio.options = options;

      var response =
          await dio.get(ApiConstant.BASE_URL + ApiConstant.GETDETAILS);
      return GetDetailsResponse.fromJson(jsonDecode(response.toString()));
    } on DioError catch (e) {
      if (e.response != null) {
        var errorData = jsonDecode(e.response.toString());
        var errorMessage = errorData["message"];
        throw FetchDataException(errorMessage);
      } else {
        throw SocketException("");
      }
    }
  }

  Future<VerifyCodeResponse> verifyCode(String email, int code) async {
    try {
      var map = {"email": email, "verifyToken": code};
      var response = await dio
          .post(ApiConstant.BASE_URL + ApiConstant.VERIFYCODE, data: map);
      return VerifyCodeResponse.fromJson(json.decode(response.toString()));
    } on DioError catch (e) {
      if (e.response != null) {
        var errorData = jsonDecode(e.response.toString());
        var errorMessage = errorData["message"];
        throw FetchDataException(errorMessage);
      } else {
        throw SocketException("");
      }
    }
  }
  Future<VerifyOTPPasswordResponse> verifyPasswordOtp(String email, int code) async {
    try {
      var map = {"email": email, "resetPasswordOTP": code};
      var response = await dio
          .post(ApiConstant.BASE_URL + ApiConstant.VERIFYOTPPASSWORD, data: map);
      return VerifyOTPPasswordResponse.fromJson(json.decode(response.toString()));
    } on DioError catch (e) {
      if (e.response != null) {
        var errorData = jsonDecode(e.response.toString());
        var errorMessage = errorData["message"];
        throw FetchDataException(errorMessage);
      } else {
        throw SocketException("");
      }
    }
  }

  Future<ForgotPasswordResponse> forgotPassword(
      BuildContext context, String email) async {
    try {
      var map = {
        "email": email,
      };
      var response = await dio
          .post(ApiConstant.BASE_URL + ApiConstant.FORGOTPASSWORD, data: map);
      return ForgotPasswordResponse.fromJson(json.decode(response.toString()));
    } on DioError catch (e) {
      if (e.response != null) {
        var errorData = jsonDecode(e.response.toString());
        var errorMessage = errorData["message"];
        throw FetchDataException(errorMessage);
      } else {
        throw SocketException("");
      }
    }
  }
  Future<ResetPassword> resetPassword(String email,String password) async {
    try {
      var map = {"email": email, "password": password};
      var response = await dio
          .post(ApiConstant.BASE_URL + ApiConstant.RESETPASSWORD, data: map);
      return ResetPassword.fromJson(json.decode(response.toString()));
    } on DioError catch (e) {
      if (e.response != null) {
        var errorData = jsonDecode(e.response.toString());
        var errorMessage = errorData["message"];
        throw FetchDataException(errorMessage);
      } else {
        throw SocketException("");
      }
    }
  }
  Future<EditProfileResponse> editProfile(
      String dogName,
      String dogSex,
      String dogBreed,
      String ownerName,
      String description,
      String ownerSurname,
      String address,
      String contactPhone,
      String whatsapp,
      String email,
      String veterinaryNumber,
      int dogBirthDate,
      File? imageFile,
      File? bannerImage
    ) async {
    try {
      var map = <String, dynamic>{
        "email": email,
        "dogName": dogName,
        "dogBreed": dogBreed,
        "dogSex": dogSex,
        "ownerSurname": ownerSurname,
        "description":description,
        "ownerName": ownerName,
        "address": address,
        "contactPhone": contactPhone,
        "whatsapp": whatsapp,
        "veterinaryNumber": veterinaryNumber,
        "dogBirthDate": dogBirthDate,
      };
      if (imageFile != null) {
        var picture =
        MultipartFile.fromFileSync(imageFile.path, filename: "image.png");
        var imageMap = {
          'image': picture,
        };
        map.addAll(imageMap);
      }
      if (bannerImage != null) {
        var bpicture =
        MultipartFile.fromFileSync(bannerImage.path, filename: "image.png");
        var imageMap = {
          'bannerImage': bpicture,
        };
        map.addAll(imageMap);
      }
      var id = SharedPref.prefs?.getString(SharedPref.ID);
      var response = await dio.put(ApiConstant.BASE_URL + ApiConstant.EDITPRIFILE +id!, data: FormData.fromMap(map));
      return EditProfileResponse.fromJson(json.decode(response.toString()));
    } on DioError catch (e) {
      if (e.response != null) {
        var errorData = jsonDecode(e.response.toString());
        var errorMessage = errorData["message".tr()];
        throw FetchDataException(errorMessage);
      } else {
        throw SocketException("");
      }
    }
  }
}
