// To parse this JSON data, do
//
//     final expert = expertFromJson(jsonString);

import 'dart:convert';

List<Expert> expertFromJson(String str) => List<Expert>.from(json.decode(str).map((x) => Expert.fromJson(x)));

String expertToJson(List<Expert> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Expert {
  final String id;
  final String email;
  final String password;
  final bool isVerified;
  final String emailToken;
  final String firstname;
  final String lastname;
  final String userType;
  final bool isAdmin;
  final String t;
  final String bio;
  final List<String> expertise;
  final double rating;
  final String nationality;
  final String phoneNumber;
  final String address;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Expert({
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
    required this.bio,
    required this.expertise,
    required this.rating,
    required this.nationality,
    required this.phoneNumber,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Expert.fromJson(Map<String, dynamic> json) => Expert(
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
    bio: json["bio"],
    expertise: List<String>.from(json["expertise"].map((x) => x)),
    rating: json["rating"]?.toDouble(),
    nationality: json["nationality"],
    phoneNumber: json["phoneNumber"],
    address: json["address"],
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
    "bio": bio,
    "expertise": List<dynamic>.from(expertise.map((x) => x)),
    "rating": rating,
    "nationality": nationality,
    "phoneNumber": phoneNumber,
    "address": address,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
