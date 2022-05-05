class GetPetDetailsResponse {
  late bool success;
  List<Data> data = [];

  GetPetDetailsResponse.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    if(json['data'] != null){
      List<Data> list = [];
      for(int i = 0 ; i < json['data'].length ; i++){
        list.add(Data.fromJson(json['data'][i]));
      }
      data = list;
    }
  }
}
class Data {
  late String petName;
  late String petBreed;
  late String petSex;
  late String description;
  late String image;
  late String id;
  late String userId;
  late String veterinaryNumber;
  late String bannerImage;
  late int petBirthDate;
  Data.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    userId = json["userId"];
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
