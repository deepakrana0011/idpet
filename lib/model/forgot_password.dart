class ForgotPasswordResponse {
  late bool success;
  Data? data;
  late String message;

  ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    message = json["message"];
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }
}

class Data {
  late String email;
  late String id;
  Data.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    email = json["email"];
  }
}
