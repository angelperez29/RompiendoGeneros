import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class DBManage {
  String url = 'http://10.0.0.34:8000/';
  Future<String> setDataEmployees(String name, String user, String email,
      String passwd, List<String> rol) async {
    try {
      Map data = {
        'name': name,
        'user': user,
        'email': email,
        'passwd': passwd,
        'rol': rol,
      };
      var body = json.encode(data);
      var response = await http
          .post(
            url + 'addEmployees',
            headers: {
              "content-type": "application/json",
              "accept": "application/json",
            },
            body: body,
          )
          .timeout(
            const Duration(
              seconds: 90,
            ),
          );
      return response.toString();
    } on SocketException catch (e) {
      print("Errors");
      return 'Error conection:\n' + e.toString();
    }
  }
}
