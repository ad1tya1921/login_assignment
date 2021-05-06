import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: MyHomePage(title: 'Login Demo'),
        

    );
  }
}
class MyHomePage extends StatefulWidget{
  MyHomePage({Key key ,this.title}): super(key:  key);
  final String title;
  _MyHomePageState Createstate() => _MyHomePageState();

  @override
  State<StatefulWidget> createState() {

  }
}
class _MyHomePageState extends State<MyHomePage>{
  get style => null;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email ID",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(22.0))


      ),

    );
    final passwordField = TextFormField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(22.0))


      ),
      validator: (value) {
        if (value.isEmpty) {
          return "* Required";
        } else if (value.length < 4) {
          return "Password should be atleast 4 characters";
        } else if (value.length > 8) {
          return "Password should not be greater than 8 characters";
        } else
          return null;
      },
    );
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){},
        child: Text("Welcome",
          textAlign: TextAlign.center,
          style: style.copyWith(color: Colors.white,fontWeight: FontWeight.bold)),
        ),
      );

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    height: 45.0),
                  emailField,
                  SizedBox(
                    height: 25.0),
                  passwordField,
                  SizedBox(
                    height: 35.0),
                  loginButton,
                  SizedBox(height: 15.0),


                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}
