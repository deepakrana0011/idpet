class EditPetProfileResponse {
  late bool success;
  late String message;
  Data? data;

  EditPetProfileResponse.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    message = json["message"];
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }
}
class Data {
  late String petName;
  late String petBreed;
  late String petSex;
  late String description;
  late String image;
  late String id;
  late String bannerImage;
  late int petBirthDate;
  late String veterinaryNumber;



  Data.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    petName = json["petName"];
    petBreed = json["petBreed"];
    petSex = json["petSex"];
    description =json["description"];
    image = json["image"];
    bannerImage = json["bannerImage"];
    petBirthDate = json["petBirthDate"];
    veterinaryNumber = json["veterinaryNumber"];
  }
}

