import 'dart:convert';
import 'dart:io';
import 'package:devsoc_app/constants/links.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

class ProfileGet extends GetxController {
  RxBool profileLoader = true.obs;

  Future<Map> getProfile(String token) async {
    var url = Uri.parse(profileRoute);
    try {
      var response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader: token,
      });
      var res = json.decode(response.body);
      print(res);
      profileLoader.value = false;
      return res;
    } catch (e) {
      return {"message": "error"};
    }
  }
}
