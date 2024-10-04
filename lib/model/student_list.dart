// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

List<Student> studentFromJson(String str) => List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));

String studentToJson(List<Student> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Student {
  final String id;
  final String email;
  final String password;
  final bool isVerified;
  final String? emailToken;
  final String firstname;
  final String lastname;
  final T userType;
  final T t;
  final String? school;
  final String? schoolEmail;
  final String? nationality;
  final String? phoneNumber;
  final String? address;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final bool isAdmin;

  Student({
    required this.id,
    required this.email,
    required this.password,
    required this.isVerified,
    required this.emailToken,
    required this.firstname,
    required this.lastname,
    required this.userType,
    required this.t,
    this.school,
    this.schoolEmail,
    this.nationality,
    this.phoneNumber,
    this.address,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.isAdmin,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    id: json["_id"],
    email: json["email"],
    password: json["password"],
    isVerified: json["isVerified"],
    emailToken: json["emailToken"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    userType: tValues.map[json["userType"]]!,
    t: tValues.map[json["__t"]]!,
    school: json["school"],
    schoolEmail: json["schoolEmail"],
    nationality: json["nationality"],
    phoneNumber: json["phoneNumber"],
    address: json["address"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    isAdmin: json["isAdmin"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "password": password,
    "isVerified": isVerified,
    "emailToken": emailToken,
    "firstname": firstname,
    "lastname": lastname,
    "userType": tValues.reverse[userType],
    "__t": tValues.reverse[t],
    "school": school,
    "schoolEmail": schoolEmail,
    "nationality": nationality,
    "phoneNumber": phoneNumber,
    "address": address,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "isAdmin": isAdmin,
  };
}

enum T {
  STUDENT
}

final tValues = EnumValues({
  "Student": T.STUDENT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
