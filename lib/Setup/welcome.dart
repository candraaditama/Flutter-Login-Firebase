import 'package:flutter/material.dart';
import 'package:sistem_absensi/Setup/signIn.dart';
import 'package:sistem_absensi/Setup/signUp.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sistem Absensi Sales'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: navigateToSignIn,
            child: Text('Sign In'),
          ),
          RaisedButton(
            onPressed:navigateToSignUp,
            child: Text('Sign Up'),
          )
        ],
      ),
    );
  }
    void navigateToSignIn(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage(), fullscreenDialog: true));
    }

    void navigateToSignUp(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp(), fullscreenDialog: true));
    }

}
