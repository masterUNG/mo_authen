import 'package:flutter/material.dart';
import 'screens/register_page.dart';

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
    );
  }

  Widget passwordTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Password:', hintText: 'more 6 Charator'),
    );
  }

  Widget signInButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        'Sign In',
        style: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      onPressed: () {
        print('You Click SignIn');
      },
    );
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
    return Scaffold(
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
                      child: signInButton(),
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
    );
  }
}
