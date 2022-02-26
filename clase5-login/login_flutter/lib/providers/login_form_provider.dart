import 'package:flutter/material.dart';


class LoginFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formKey=new GlobalKey<FormState>();



  String email = '';
  String password = '';

  // voy a bloquear el boton cuando hago la peticion
  bool _isLoading=false;
  bool get isLoading=>_isLoading;
  set isLoading (bool value){
    _isLoading=value;
    notifyListeners();
  }
  // hago la validacion
  bool  isValidForm(){
    print('$email - $password');

    return formKey.currentState?.validate()??false;
  }
}