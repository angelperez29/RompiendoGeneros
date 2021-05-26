import 'package:flutter/material.dart';
import '../../components/widgets/Background.dart';
import '../../components/widgets/NavDrawer.dart';
import '../../databases/DBManage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../components/widgets/CardCategoriesEditing.dart';

class EmployeesHistorial extends StatefulWidget {
  EmployeesHistorial({Key key}) : super(key: key);

  @override
  _EmployeesHistorialState createState() => _EmployeesHistorialState();
}

class _EmployeesHistorialState extends State<EmployeesHistorial> {
  List userDataEmy;
  List dataE;
  List dataP;
  List userDataPrd;
  String url = DBManage().getURI() + 'getDataDB';

  getDataEmployees() async {
    http.Response response = await http.get(url + '/employees');
    dataE = json.decode(response.body);
    setState(
      () {
        userDataEmy = dataE;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getDataEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Side menu
      drawer: NavDrawer(),
      appBar: gradientAppBar("Historial del empleados"),
      body: Container(
        decoration: background(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(
              0.0,
            ),
          ),
          child: ListView.builder(
            // Si la lista de empleados esta vacia no se muestra nada
            // dado que pasamos un 0 al index y por ende termina el proceso
            itemCount: userDataEmy == null ? 0 : userDataEmy.length,
            itemBuilder: (BuildContext context, int index) {
              if (userDataEmy[index]['status'] == 'inactive') {
                return CardCategoriesEditing(
                  path: 'assets/images/personal.png',
                  text: userDataEmy[index]['name'],
                  subtext: userDataEmy[index]['_id'] +
                      '\n' +
                      userDataEmy[index]['email'],
                  route: '/EditItems',
                  categorie: 'Personal',
                  data: userDataEmy,
                  id: userDataEmy[index]['_id'],
                  state: userDataEmy[index]['status'],
                );
              } else {
                return Text('');
              }
            },
          ),
        ),
      ),
    );
  }
}
