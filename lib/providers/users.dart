import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Users with ChangeNotifier {
  String id;
  String email;
  String password;
  int type;
  bool isfound = false;

  Users({
    this.id,
    this.email,
    this.password,
    this.type,
  });

  void setemail(String email) {
    this.email = email;
  }

  void setpassword(String password) {
    this.password = password;
  }

  Future<void> fetchusersdata() async {
    const url =
        'https://pharmacies-f20f5-default-rtdb.firebaseio.com/users.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<dynamic, dynamic>;
      extractedData.forEach((userid, userdata) async {
        if (email == userdata['email'] && password == userdata['password']) {
          isfound = true;
        }
      });
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
