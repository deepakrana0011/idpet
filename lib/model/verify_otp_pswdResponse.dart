class VerifyOTPPasswordResponse{

  late bool success ;
  late String message;

  VerifyOTPPasswordResponse.fromJson(Map <String, dynamic> json) {
    success =json["success"];
    message =json["message"];
  }
}