import 'package:flutter/material.dart';

class Feedbacks extends StatefulWidget {
  @override
  _FeedbacksState createState() => _FeedbacksState();
}

class _FeedbacksState extends State<Feedbacks> {
  String username;
  String issue;
  String description;

  String errorUsernamePassword; // name and password error msg are the same
  String errorEmail;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                "Write to us",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
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
                    labelText: "Username",
                    hintText: "Username",
                    hintStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              buildInputField("Issue", false),
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
                    labelText: "Description",
                    hintText: "Description",
                    hintStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
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
          Navigator.pop(context);
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
