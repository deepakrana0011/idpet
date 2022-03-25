
class VerifyCodeResponse{

  late bool success ;
  late String message;

  VerifyCodeResponse.fromJson(Map <String, dynamic> json) {
    success =json["success"];
    message =json["message"];
  }

}