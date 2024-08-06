import 'dart:convert';

import 'package:api_integration/user_apis/user_model_class.dart';
import 'package:stacked/stacked.dart';

import 'package:http/http.dart' as http;

class UserApiVM extends BaseViewModel {
  List<UserModelClass> userModelListObj = [];

  Future<List<UserModelClass>> fetchUserInfo() async {
    //server se request ki hai
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    // jo server se response aya hai usko data me store kiya
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        userModelListObj.add(UserModelClass.fromJson(index));
      }
      return userModelListObj;
    } else {
      return userModelListObj;
    }
  }
}
