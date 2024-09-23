class SuccessModel {
  bool? success;
  String? message;
  String? errors;
  int? status;

  SuccessModel({this.success, this.message, this.status, this.errors});

  SuccessModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    status = json['status'];
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['status'] = this.status;
    data['errors'] = this.errors;
    return data;
  }
}
