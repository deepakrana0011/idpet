import 'package:dog_app/provider/base_provider.dart';
import 'package:flutter/cupertino.dart';

class CreatePasswordProvider extends BaseProvider {
  bool isPasswordVisible = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  visiblePassword() {
    isPasswordVisible = !isPasswordVisible;

    notifyListeners();
  }
}
