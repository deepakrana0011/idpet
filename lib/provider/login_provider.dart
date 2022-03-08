import 'package:dog_app/provider/base_provider.dart';
import 'package:flutter/cupertino.dart';

class LoginProvider extends BaseProvider {

  final formKey = GlobalKey<FormState>();
  final  emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = true;

  visiblePassword() {
    isPasswordVisible = !isPasswordVisible;

    notifyListeners();
  }
}
