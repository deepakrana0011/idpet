class LoginResponse {
  late bool success;
  late String message;
  String? jwtToken;
  Data? data;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    message = json["message"];
    jwtToken = json["jwtToken"] != null ? (json["jwtToken"]) : null;
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }
}

class Data {
  late String ownerName;
  late String address;
  late String contactPhone;
  late String whatsapp;
  late String email;
  late String id;
  late int verifyToken;
  late int verifyStatus;
  Data.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    ownerName = json["ownerName"];
    email = json["email"];
    address = json["address"];
    contactPhone = json["contactPhone"];
    whatsapp = json["whatsapp"];
    verifyToken = json["verifyToken"];
    verifyStatus = json["verifyStatus"];
  }
}
