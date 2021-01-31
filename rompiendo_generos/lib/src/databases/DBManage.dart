import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class DBManage {
  String url = 'http://10.0.0.34:8000/';
  // Metodo para ingresar datos a la DB
  Future<http.Response> setDataEmployees(String name, String user, String email,
      String passwd, List<String> rol, String status) async {
    Map data = {
      'name': name,
      'user': user,
      'email': email,
      'passwd': passwd,
      'rol': rol,
      'status': status,
    };
    var body = json.encode(data);
    http.Response response = await http
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
    return response;
  }

  Future<http.Response> setDataProducts(id, name, categorie, price) async {
    Map data = {
      'id': id,
      'name': name,
      'categorie': categorie,
      'price': price,
    };

    var body = json.encode(data);

    http.Response response = await http.post(
      url + 'setProducts',
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
      body: body,
    );

    return response;
  }
}
