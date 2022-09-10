import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginProvider with ChangeNotifier{

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  bool _obsecureValue = false;
  bool get obsecureValue => _obsecureValue;

  setObsecure(){
    _obsecureValue = !_obsecureValue;
    notifyListeners();
  }

void login(String email, String password) async{

  setLoading(true);

  try{
    Response response = await post(Uri.parse('https://reqres.in/api/login'),
    body: {
      'email': email,
      'password': password,
    }
    );

    if(response.statusCode == 200){
      setLoading(false);
      print('Successfull');
    }else{
      setLoading(true);
      print('failed');

    }
  }catch(e){
    setLoading(true);
    print(e.toString());
  }
}

}