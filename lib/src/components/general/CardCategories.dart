import 'package:flutter/material.dart';

class CardCategories extends StatelessWidget {
  final String path;
  final String text;
  final String categorie;
  final String route;

  const CardCategories({
    Key key,
    @required this.path,
    @required this.text,
    @required this.route,
    @required this.categorie,
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
                this.categorie,
                this.route,
                this.text,
                this.path,
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

Widget _buttonEdit(
  String categorie,
  String route,
  String text,
  String pathIcon,
) {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return IconButton(
        icon: Icon(
          Icons.arrow_forward_ios,
        ),
        iconSize: 30,
        tooltip: "Administrar",
        onPressed: () {
          Navigator.of(context).pushNamed(
            route,
            arguments: {
              'categorie': categorie,
              'userPrd': text,
              'pathIcon': pathIcon,
            },
          );
        },
      );
    },
  );
}
