import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';


void main() => runApp(MyApp());

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Login Assignment';




    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: LoginForm(),
      ),
    );
  }
}

// Create a Form Widget
class LoginForm extends StatefulWidget {
  @override
  FirstPage createState() {
    return FirstPage();
  }
}


class FirstPage extends State<LoginForm> {

  final _formKey = GlobalKey<FormState>();
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80.0),
          ),

          // Username Field


          TextFormField(
            decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Email",
            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0))
           ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter valid email id';
              }
              else if (!value.isValidEmail()){
                Fluttertoast.showToast(
                    msg: 'Invalid Email ',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.red,
                    textColor: Colors.black,
                    fontSize: 16.0
                );
              }
            }
          ),


          // Adding a padding in between username and padding

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
          ),

          // Adding a padding in between username and padding

          // Password Field

          TextFormField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0))
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter valid password';
              }
              else if (value.length < 4) {
                Fluttertoast.showToast(
                    msg: 'Entered password short ',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.red,
                    textColor: Colors.black,
                    fontSize: 16.0
                );
              }
              else if (value.length > 8) {
                Fluttertoast.showToast(
                    msg: 'Enter valid Passwprd ',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.red,
                    textColor: Colors.black,
                    fontSize: 16.0
                );
              }
            },
           ),
          // Adding a button to validate form


          Container(
            margin: EdgeInsets.all(50),
            alignment: Alignment.center,
            child: ElevatedButton(
              child: Text('LOGIN', style: TextStyle(fontSize: 20.0),),
              //color: Colors.blueAccent,
              //textColor: Colors.white,
              onPressed: () {
                if (_formKey.currentState.validate()){
                  if (isValid) {
                    Fluttertoast.showToast(
                        msg: "Please Enter a valid Email",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                }
                //isValid = EmailValidator.validate(value.text);

              },
            ),
          ),
        ],

      ),

    );
  }
}
