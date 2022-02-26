import 'package:flutter/material.dart';
import 'package:login_flutter/model/models.dart';

class ProductFormProvider extends ChangeNotifier{
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Product product;

  ProductFormProvider(this.product);


  updateAvailability (bool value){
    this.product.avaible= value;
    notifyListeners();
  }

  bool isValidForm(){
    return formKey.currentState?.validate()??false;
  }
}