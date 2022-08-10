import 'dart:convert';

import 'package:funny_macro/model/status_model.dart';

LoginModel LoginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String LoginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String username;
  String email;
  String firstName;
  String lastName;
  String isActive;
  String remainingDay;
  int lastLogin;
  String ipAddress;
  String userName;
  String isTester;
  String isAdmin;
  int active;
  MobilStatus mobilStatus;
  LoginModel({
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.isActive,
    required this.remainingDay,
    required this.lastLogin,
    required this.ipAddress,
    required this.userName,
    required this.isTester,
    required this.isAdmin,
    required this.active,
    required this.mobilStatus,
  });

  factory LoginModel.fromJson(Map<String, dynamic> jsons) {
    return LoginModel(
      username: jsons["username"],
      email: jsons["email"],
      firstName: jsons["first_name"],
      lastName: jsons["last_name"],
      isActive: jsons["is_active"],
      remainingDay: jsons["remaining_day"],
      lastLogin: jsons["last_login"],
      ipAddress: jsons["ip_address"],
      userName: jsons["user_name"],
      isTester: jsons["is_tester"],
      isAdmin: jsons["is_admin"],
      active: jsons["active"],
      mobilStatus: MobilStatus.fromJson(json.decode(jsons["mobil_status"])),
    );
  }
  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "is_active": isActive,
        "remaining_day": remainingDay,
        "last_login": lastLogin,
        "ip_address": ipAddress,
        "user_name": userName,
        "is_tester": isTester,
        "is_admin": isAdmin,
        "active": active,
        "mobil_status": mobilStatus.toJson()
      };
}
