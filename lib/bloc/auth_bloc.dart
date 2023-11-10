import 'dart:async';

import 'package:chat_app/firebase/firebase_auth.dart';
import 'package:chat_app/validators/validation.dart';

class AuthBloc {
  final _fireAuth = FireAuth();

  final StreamController _nameController = StreamController();
  final StreamController _emailController = StreamController();
  final StreamController _passwordController = StreamController();
  final StreamController _passwordConfirmController = StreamController();

  Stream get nameController => _nameController.stream;
  Stream get emailController => _emailController.stream;
  Stream get passwordController => _passwordController.stream;
  Stream get passwordConfirmController => _passwordConfirmController.stream;

  bool isValidInfo(
      String name, String email, String password, String passwordConfirm) {
    if (!Validation.isValidName(name)) {
      _nameController.sink.addError('Vui lòng nhập tên');
      return false;
    }
    _nameController.sink.add("");

    if (!Validation.isValidEmail(email)) {
      _emailController.sink.addError('Email không hợp lệ');
      return false;
    }
    _emailController.sink.add("");

    if (!Validation.isValidPassword(password)) {
      _passwordController.sink.addError('Mật khẩu phải có trên 5 kí tự');
      return false;
    }
    _passwordController.sink.add("");

    if (!Validation.isValidPasswordConfirm(password, passwordConfirm)) {
      _passwordConfirmController.sink
          .addError('Mật khẩu xác nhận phải trùng khớp với mật khẩu');
      return false;
    }
    _passwordConfirmController.sink.add("");

    return true;
  }

  void signUp(String name, String email, String password,
      String passwordConfirm, Function onSuccess, Function(String) onError) {
    _fireAuth.signUp(
        name, email, password, passwordConfirm, onSuccess, onError);
  }

  void signIn(String email, String pass, Function onSuccess,
      Function(String) onSignInError) {
    _fireAuth.signIn(email, pass, onSuccess, onSignInError);
  }

  void dispose() {
    _nameController.close();
    _emailController.close();
    _passwordController.close();
    _passwordConfirmController.close();
  }
}
