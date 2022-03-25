class ResetPassword{

  late bool success ;
  late String message;

  ResetPassword.fromJson(Map <String, dynamic> json) {
    success =json["success"];
    message =json["message"];
  }
}