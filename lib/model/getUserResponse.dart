class GetDetailsResponse {
  late bool success;
  Data? data;

  GetDetailsResponse.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }
}

class Data {
  late String ownerName;
  late String ownerSurname;
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
    ownerSurname =json["ownerSurname"];
    email = json["email"];
    address = json["address"];
    contactPhone = json["contactPhone"];
    whatsapp = json["whatsapp"];
    verifyToken = json["verifyToken"];
    verifyStatus = json["verifyStatus"];

  }
}
