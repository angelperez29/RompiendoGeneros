import 'package:flutter/material.dart';

class CardCategories extends StatelessWidget {
  final String path;
  final String text;
  final String screen;
  final String route;

  const CardCategories({
    Key key,
    @required this.path,
    @required this.text,
    @required this.route,
    @required this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(
              this.text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Sarina',
              ),
            ),
            leading: Image.asset(
              this.path,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _buttonEdit(
                this.screen,
                this.route,
                this.text,
              ),
            ],
          ),
        ],
      ),
      elevation: 15.0,
      color: Color.fromARGB(239, 239, 239, 238),
    );
  }
}

Widget _buttonEdit(String screen, String route, String text) {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return IconButton(
        icon: Icon(
          Icons.edit,
        ),
        iconSize: 30,
        tooltip: "Administrar",
        onPressed: () {
          Navigator.of(context).pushNamed(
            route,
            arguments: {
              'screen': screen,
              'userPrd': text,
            },
          );
        },
      );
    },
  );
}
