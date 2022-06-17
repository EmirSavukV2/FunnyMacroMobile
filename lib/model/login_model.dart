import 'dart:convert';

LoginModel LoginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String LoginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  late String username;
  late String email;
  late String firstName;
  late String lastName;
  late String isActive;
  late String remainingDay;
  late int lastLogin;
  late String ipAddress;
  late String userName;
  late String isTester;
  late String isAdmin;
  late int active;
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
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        username: json["username"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        isActive: json["is_active"],
        remainingDay: json["remaining_day"],
        lastLogin: json["last_login"],
        ipAddress: json["ip_address"],
        userName: json["user_name"],
        isTester: json["is_tester"],
        isAdmin: json["is_admin"],
        active: json["active"],
      );

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
      };
}
