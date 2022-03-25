

class SignupResponse {
  late bool success;
  late String message;
  String? jwtToken;
  Data? data;

  SignupResponse.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    message = json["message"];
    jwtToken = json["jwtToken"] != null ? (json["jwtToken"]) : null;
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }
}

class Data {
  late String dogName;
  late String dogBreed;
  late String dogSex;
  late String ownerName;
  late String description;
  late String ownerSurname;
  late String address;
  late String contactPhone;
  late String whatsapp;
  late String email;
  late String image;
  late String id;
  late String bannerImage;
  late int dogBirthDate;
  late String veterinaryNumber;



  Data.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    dogName = json["dogName"];
    dogBreed = json["dogBreed"];
    dogSex = json["dogSex"];
    ownerName = json["ownerName"];
    description =json["description"];
    ownerSurname = json["ownerSurname"];
    email = json["email"];
    address = json["address"];
    contactPhone = json["contactPhone"];
    whatsapp = json["whatsapp"];
    image = json["image"];
    bannerImage = json["bannerImage"];
    dogBirthDate = json["dogBirthDate"];
    veterinaryNumber = json["veterinaryNumber"];
  }
}
