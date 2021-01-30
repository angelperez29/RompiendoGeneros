import 'package:flutter/material.dart';

class CardCategoriesEditing extends StatelessWidget {
  final String path;
  final String text;
  final String subtext;
  final String categorie;
  final String route;

  const CardCategoriesEditing({
    Key key,
    @required this.path,
    @required this.text,
    @required this.subtext,
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
            subtitle: Text(
              this.subtext,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
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
              _buttonDelete(
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
    String categorie, String route, String text, String pathIcon) {
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
              'categorie': categorie,
              'text': text,
              'pathIcon': pathIcon,
            },
          );
        },
      );
    },
  );
}

Widget _buttonDelete(
    String categorie, String route, String text, String pathIcon) {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return IconButton(
        icon: Icon(
          Icons.delete,
        ),
        iconSize: 30,
        tooltip: "Administrar",
        onPressed: () {
          Navigator.of(context).pushNamed(
            route,
            arguments: {
              'categorie': categorie,
              'text': text,
              'pathIcon': pathIcon,
            },
          );
        },
      );
    },
  );
}
