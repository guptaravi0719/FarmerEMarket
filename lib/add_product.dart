import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String username;
  String issue;
  String description;

  String errorUsernamePassword; // name and password error msg are the same
  String errorEmail;
  File _image;

  Future getImagefromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 20),
                child: TextField(
                  onChanged: (text) {
                    setState(() {
                      this.description = text;
                    });
                  },
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: "Product Name",
                    hintText: "Product Name",
                    hintStyle: TextStyle(fontSize: 18),
                    // border: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              buildInputField("Price", false),
              Padding(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 20),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  onChanged: (text) {
                    setState(() {
                      this.description = text;
                    });
                  },
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: "Details of Product",
                    hintText: "Details of Product",
                    hintStyle: TextStyle(fontSize: 18),
                    // border: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
//camera functionality
              GestureDetector(
                onTap: getImagefromCamera,
                child: _image == null
                    ? Container(
                        decoration: BoxDecoration(
                            color: Colors.red[50],
                            border:
                                Border.all(color: Colors.red[200], width: 1.0),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 30.0),
                            Icon(Icons.camera_alt, color: Colors.red),
                            SizedBox(height: 10.0),
                            Text('Take Image of the Item',
                                style: TextStyle(color: Colors.red)),
                            SizedBox(height: 30.0)
                          ],
                        ))
                    : Image.file(_image),
              ),

              buildSignUpButton(size),

              // buildLoginText(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField(String fieldName, bool visible) {
    return Container(
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        onChanged: (text) {
          setState(() {
            if (fieldName == "Username")
              this.username = text;
            else if (fieldName == "Issue")
              this.issue = text;
            else
              this.description = text;
          });
        },
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
          labelText: fieldName,
          hintText: fieldName,
          hintStyle: TextStyle(fontSize: 18),
          //   border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          errorText: fieldName == "Email" ? errorEmail : errorUsernamePassword,
        ),
      ),
      margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
    );
  }

  Widget buildSignUpButton(Size size) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: FlatButton(
        onPressed: () {
          // TODO: implement validate function
//          print(username + " " + password);
//          validate();
          // Navigator.pop(context);
        },
        child: Text(
          "Submit",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        shape: StadiumBorder(),
        color: Colors.green,
        splashColor: Colors.indigo,
        padding: EdgeInsets.fromLTRB(size.width / 8, 15, size.width / 8, 15),
      ),
    );
  }

  // Widget buildLoginText(Size size) {
  //   return Container(
  //     margin: EdgeInsets.only(bottom: 20, top: 10),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         Text("Already Have an account, "),
  //         InkWell(
  //           child: Text(
  //             "Login from here.",
  //             style: TextStyle(
  //               color: Colors.lightBlue,
  //               fontWeight: FontWeight.bold,
  //               decoration: TextDecoration.underline,
  //             ),
  //           ),
  //           onTap: () {
  //             Navigator.pop(context);
  //             Navigator.pushNamed(context, '/login');
  //           },
  //         )
  //       ],
  //     ),
  //   );
  // }
}
