// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.action,
    required this.usercode,
    required this.password,
    required this.tenant,
  });

  String action;
  String usercode;
  String password;
  String tenant;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    action: json["Action"],
    usercode: json["Usercode"],
    password: json["Password"],
    tenant: json["Tenant"],
  );

  Map<String, dynamic> toJson() => {
    "Action": action,
    "Usercode": usercode,
    "Password": password,
    "Tenant": tenant,
  };
}
