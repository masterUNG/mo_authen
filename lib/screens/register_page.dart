import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passwordString;

  Widget nameTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name:', hintText: 'Eng Name'),
      validator: (String value) {
        if (value.length == 0) {
          return 'Please Fill Name ?';
        }
      },
      onSaved: (String value) {
        nameString = value.trim();
      },
    );
  }

  Widget emailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email Address:', hintText: 'you@email.com'),
      validator: (String value) {
        if (!value.contains('@')) {
          return 'Please Fill Email Format you@email.com';
        }
      },
      onSaved: (String value) {
        emailString = value.trim();
      },
    );
  }

  Widget passwordTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Password:', hintText: ' more 6 Charator'),
      validator: (String value) {
        if (value.length <= 5) {
          return 'Please Type Password more 6 Charator';
        }
      },
      onSaved: (String value) {
        passwordString = value.trim();
      },
    );
  }

  void sentValueToServer(BuildContext context) async {
    print('sentValue Work');
    print(formKey.currentState.validate());

    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      String urlString =
          'https://www.androidthai.in.th/mo/addDataMaster.php?isAdd=true&Name=$nameString&User=$emailString&Password=$passwordString';
      print(urlString);
      var response = await get(urlString);
      var result = json.decode(response.body);
      print('result ==> $result');
      if (result.toString() == 'true') {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Register'),
          actions: <Widget>[
            IconButton(
              tooltip: 'Upload Value To Server',
              icon: Icon(Icons.cloud_upload),
              onPressed: () {
                print('You click Upload');
                sentValueToServer(context);
              },
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.yellow[400], Colors.yellow[800]],
                  begin: Alignment(0, -1))),
          padding: EdgeInsets.only(left: 50.0, top: 50.0, right: 50.0),
          child: Column(
            children: <Widget>[
              nameTextField(),
              emailTextField(),
              passwordTextField()
            ],
          ),
        ),
      ),
    );
  }
}
