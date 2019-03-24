import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Widget nameTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name:', hintText: 'Eng Name'),
    );
  }

  Widget emailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email Address:', hintText: 'you@email.com'),
    );
  }

  Widget passwordTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Password:', hintText: ' more 6 Charator'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        actions: <Widget>[
          IconButton(tooltip: 'Upload Value To Server',
            icon: Icon(Icons.cloud_upload),
            onPressed: () {
              print('You click Upload');
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
    );
  }
}
