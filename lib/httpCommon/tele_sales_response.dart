class TeleSalesResponse {
  int? id;
  String? firstName;
  String? lastName;
  String? profileThumbnail;

  TeleSalesResponse(
      {this.id, this.firstName, this.lastName, this.profileThumbnail});

  TeleSalesResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profileThumbnail = json['profile_thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['profile_thumbnail'] = profileThumbnail;
    return data;
  }
}
