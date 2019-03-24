import 'package:flutter/material.dart';
import 'screens/register_page.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'models/user_model.dart';
import 'screens/service.dart';

// void main() {
//   runApp(App());
// }

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mo Authen',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  final myScaffold = GlobalKey<ScaffoldState>();
  String email, password;

  Widget showLogo() {
    return Image.asset('images/logo.png');
  }

  Widget showTitle() {
    return Text(
      'Mo Authen',
      style: TextStyle(
          fontFamily: 'Pacifico',
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.red[900]),
    );
  }

  Widget emailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email Address:', hintText: 'you@email.com'),
      validator: (String value) {
        if (!value.contains('@')) {
          return 'Please Type Email Format you@email.com';
        }
      },
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget passwordTextField() {
    return TextFormField(
      obscureText: true,
      decoration:
          InputDecoration(labelText: 'Password:', hintText: 'more 6 Charator'),
      validator: (String value) {
        if (value.length <= 5) {
          return 'Please Type Password more 6 Charator';
        }
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget signInButton(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        'Sign In',
        style: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      onPressed: () {
        print('You Click SignIn');
        checkAuthen(context);
      },
    );
  }

  void checkAuthen(BuildContext context) async {
    print(formKey.currentState.validate());
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print('email = $email, password = $password');
      String url =
          'https://www.androidthai.in.th/mo/getUserWhereUserMaster.php?isAdd=true&User=$email';
      var response = await get(url);
      var result = json.decode(response.body);
      print('result => $result');
      if (result.toString() == 'null') {
        showSnackBar('User False Plase Try again');
      } else {
        String truePassword = "";
        String nameString = "";
        for (var data in result) {
          print('data => $data');
          var userModel = UserModel.fromJson(data);
          truePassword = userModel.password.toString();
          nameString = userModel.name.toString();

          if (password == truePassword) {
            // Password True
            showSnackBar('Welcome $nameString');

            var serviceRoute = new MaterialPageRoute(
                builder: (BuildContext context) => Service(
                      nameLoginString: nameString,
                    ));
            Navigator.of(context).push(serviceRoute);
          } else {
            // Password False
            showSnackBar('Please Try Again Password False');
          }
        }
      }
    } // if1
  }

  void showSnackBar(String message) {
    print(message);
    final snackBar = new SnackBar(
      duration: new Duration(seconds: 5),
      backgroundColor: Colors.red[900],
      content: Text(message),
    );
    myScaffold.currentState.showSnackBar(snackBar);
  }

  Widget signUpButton(BuildContext context) {
    return RaisedButton(
      color: Colors.blue[300],
      child: Text(
        'SignUp',
        style: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      onPressed: () {
        print('You Click SignUp');
        var registerRoute = new MaterialPageRoute(
            builder: (BuildContext context) => RegisterPage());
        Navigator.of(context).push(registerRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: myScaffold,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.yellow[200], Colors.yellow[800]],
                  begin: Alignment(-1, -1))),
          padding: EdgeInsets.only(top: 80.0),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              showLogo(),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: showTitle(),
              ),
              Container(
                margin: EdgeInsets.only(left: 50.0, right: 50.0),
                child: emailTextField(),
              ),
              Container(
                margin: EdgeInsets.only(left: 50.0, right: 50.0),
                child: passwordTextField(),
              ),
              Container(
                margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Expanded(
                      child: Container(
                        child: signInButton(context),
                      ),
                    ),
                    new Expanded(
                      child: Container(
                        child: signUpButton(context),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
