class EditProfileResponse {
  late bool success;
  late String message;
  Data? data;

  EditProfileResponse.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    message = json["message"];
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }
}

class Data {
  late String dogName;
  late String dogBreed;
  late String dogSex;
  late String ownerName;
  late String ownerSurname;
  late String description;
  late String address;
  late String contactPhone;
  late String whatsapp;
  late String email;
  late String image;
  late String id;
  late int verifyToken;
  late int verifyStatus;
  late String bannerImage;
  late int dogBirthDate;
  late String veterinaryNumber;

  Data.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    dogName = json["dogName"];
    dogBreed = json["dogBreed"];
    dogSex = json["dogSex"];
    ownerName = json["ownerName"];
    ownerSurname = json["ownerSurname"];
    description = json["description"];
    email = json["email"];
    address = json["address"];
    contactPhone = json["contactPhone"];
    whatsapp = json["whatsapp"];
    image = json["image"] != null ? (json["image"]) : null;
    verifyToken = json["verifyToken"];
    verifyStatus = json["verifyStatus"];
    bannerImage = json["bannerImage"] != null ? (json["bannerImage"]) : null;
    dogBirthDate = json["dogBirthDate"]!= 0? (json["dogBirthDate"]): null;
    veterinaryNumber = json["veterinaryNumber"];
  }
}
