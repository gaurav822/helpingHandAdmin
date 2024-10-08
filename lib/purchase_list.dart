// To parse this JSON data, do
//
//     final purchaseList = purchaseListFromJson(jsonString);

import 'dart:convert';

PurchaseList purchaseListFromJson(String str) => PurchaseList.fromJson(json.decode(str));

String purchaseListToJson(PurchaseList data) => json.encode(data.toJson());

class PurchaseList {
  final List<PurchaseWithService> purchaseWithServices;

  PurchaseList({
    required this.purchaseWithServices,
  });

  factory PurchaseList.fromJson(Map<String, dynamic> json) => PurchaseList(
    purchaseWithServices: List<PurchaseWithService>.from(json["purchaseWithServices"].map((x) => PurchaseWithService.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "purchaseWithServices": List<dynamic>.from(purchaseWithServices.map((x) => x.toJson())),
  };
}

class PurchaseWithService {
  final String id;
  final StudentId studentId;
  final List<ServiceType> serviceTypes;
  final int totalPrice;
  final String paymentStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final List<dynamic> services;

  PurchaseWithService({
    required this.id,
    required this.studentId,
    required this.serviceTypes,
    required this.totalPrice,
    required this.paymentStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.services,
  });

  factory PurchaseWithService.fromJson(Map<String, dynamic> json) => PurchaseWithService(
    id: json["_id"],
    studentId: StudentId.fromJson(json["studentId"]),
    serviceTypes: List<ServiceType>.from(json["serviceTypes"].map((x) => ServiceType.fromJson(x))),
    totalPrice: json["totalPrice"],
    paymentStatus: json["paymentStatus"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    services: List<dynamic>.from(json["services"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "studentId": studentId.toJson(),
    "serviceTypes": List<dynamic>.from(serviceTypes.map((x) => x.toJson())),
    "totalPrice": totalPrice,
    "paymentStatus": paymentStatus,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "services": List<dynamic>.from(services.map((x) => x)),
  };
}

class ServiceType {
  final String id;
  final String typename;
  final String description;
  final int price;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  ServiceType({
    required this.id,
    required this.typename,
    required this.description,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
    id: json["_id"],
    typename: json["typename"],
    description: json["description"],
    price: json["price"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "typename": typename,
    "description": description,
    "price": price,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class StudentId {
  final String id;
  final String email;
  final String password;
  final bool isVerified;
  final dynamic emailToken;
  final String firstname;
  final String lastname;
  final String userType;
  final bool isAdmin;
  final String t;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  StudentId({
    required this.id,
    required this.email,
    required this.password,
    required this.isVerified,
    required this.emailToken,
    required this.firstname,
    required this.lastname,
    required this.userType,
    required this.isAdmin,
    required this.t,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory StudentId.fromJson(Map<String, dynamic> json) => StudentId(
    id: json["_id"],
    email: json["email"],
    password: json["password"],
    isVerified: json["isVerified"],
    emailToken: json["emailToken"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    userType: json["userType"],
    isAdmin: json["isAdmin"],
    t: json["__t"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "password": password,
    "isVerified": isVerified,
    "emailToken": emailToken,
    "firstname": firstname,
    "lastname": lastname,
    "userType": userType,
    "isAdmin": isAdmin,
    "__t": t,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
