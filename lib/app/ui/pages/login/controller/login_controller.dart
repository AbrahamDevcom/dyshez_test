import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends ChangeNotifier {
  final supabase = Supabase.instance.client;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController pinCodeController = TextEditingController();

  bool _passwordVisibility = false;
  bool get passwordVisibility => _passwordVisibility;
  set passwordVisibility(bool value) {
    _passwordVisibility = value;
    notifyListeners();
  }

  Future<AuthResponse> signInWithEmail() async {
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: emailController.value.text,
      password: passwordController.value.text,
    );
    return res;
  }
}
