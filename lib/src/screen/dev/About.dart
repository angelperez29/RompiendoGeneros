import 'package:flutter/material.dart';
import 'package:rompiendo_generos/src/components/general/Background.dart';
import 'package:rompiendo_generos/src/components/general/NavDrawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class About extends StatefulWidget {
  About({Key key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  List data;
  List usersData;
  String url = 'http://10.0.0.34:8000/getDataDB/employees';
  getData() async {
    http.Response response = await http.get(url);
    data = json.decode(response.body);
    setState(
      () {
        usersData = data;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: gradientAppBar("Acerca"),
      body: ListView.builder(
        itemCount: usersData == null ? 0 : usersData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(
              children: <Widget>[
                Text('${usersData[index]['user']}'),
                Text('${usersData[index]['email']}'),
                Text('${usersData[index]['passwd']}'),
                Text('${usersData[index]['rol']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
