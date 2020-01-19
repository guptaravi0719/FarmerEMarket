import 'package:flutter/material.dart';
import 'package:yala_mazad/add_product.dart';
import 'package:yala_mazad/category.dart';

import 'package:yala_mazad/login.dart';
import 'package:yala_mazad/signUp.dart';
import 'package:yala_mazad/feedback.dart';
class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var categories = [
    {
      'title': 'Agricultural Crops',
      'img': 'img/Crop.jpeg',
    },
    {
      'title': 'Animals',
      'img': 'img/animals.jpeg',
    },
    {
      'title': 'Organic Vegetables',
      'img': 'img/organic_vegetables.jpg',
    },
    {
      'title': 'Seeds',
      'img': 'img/seeds.jpeg',
    },
    {
      'title': 'Agricultural Books',
      'img': 'img/books.jpeg',
    },
    {
      'title': 'Flowers',
      'img': 'img/flowers.jpeg',
    },
    {
      'title': 'Fruits',
      'img': 'img/fruits.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      drawer: buildDrawer(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.8),
        itemCount: 6,
        itemBuilder: (context, i) {
          return InkWell(
            child: Container(
              margin: EdgeInsets.all(5),
              child: Card(
                elevation: 2,
                child: Container(
                  child: Container(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    child: buildTitle(categories[i]['title']),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(categories[i]['img']),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Category(
                            title: categories[i]['title'],
                          )))
            },
          );
        });
  }

  Widget buildTitle(String title) {
    return Center(
      child: Container(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: BoxDecoration(
            border: Border.all(
                width: 2, color: Colors.white, style: BorderStyle.solid)),
      ),
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  Widget buildDrawer() {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: UserAccountsDrawerHeader(
//              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("img/mazzad.png"))),
              accountName: Text("Ravi Gupta"),
              accountEmail: Text("+919151239525"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("img/person.jpeg"),
                radius: 50,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  buildSeparators("Registeration"),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: buildTile(
                      "Login",
                      "/login",
                      'img/login.png',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: buildTile(
                      "SignUp",
                      "/signUp",
                      'img/registeration_ico.png',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddProduct()),
                      );
                    },
                    child: buildTile(
                      "Add Product",
                      "/add_product",
                      'img/add.jpeg',
                    ),
                  ),
                  Divider(),
                  buildSeparators("Help Center"),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>Feedbacks()),
                      );
                    },
                    child: buildTile(
                      "Feedback",
                      "/feedback",
                      'img/complete.png',
                    ),
                  ),
                  buildTile(
                    "How to order",
                    "/feedback",
                    'img/info.png',
                  ),
                  buildTile(
                    "Shipping",
                    "/feedback",
                    'img/shipping.png',
                  ),
                  buildTile(
                    "Questions and Assistance",
                    "/feedback",
                    'img/assistance.png',
                  ),
                  buildTile(
                    "About payment",
                    "/feedback",
                    'img/visa.png',
                  ),
                  Divider(),
                  buildSeparators("Public Policy"),
                  buildTile(
                    "Privacy Policy",
                    "/feedback",
                    'img/policy.png',
                  ),
                  buildTile(
                    "Terms and Conditions",
                    "/feedback",
                    'img/terms.png',
                  ),
                  buildTile(
                    "Return Policy",
                    "/feedback",
                    'img/refund.png',
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget buildSeparators(String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 10)),
        Text(
          name,
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
      ],
    );
  }

  Widget buildTile(String name, String path, String imgPath) {
    return ListTile(
      leading: SizedBox(
        height: 30,
        width: 30,
        child: Image.asset(
          imgPath,
          scale: 1.2,
        ),
      ),
      title: Text(name),
      // onTap: () {
      //   if (path != '/login' && path != '/signUp') {

      //     Navigator.pushNamed(context, path);
      //   } else
      //     Navigator.pushNamed(context, path);
      // },
    );
  }
}
