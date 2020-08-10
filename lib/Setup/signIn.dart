import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sistem_absensi/Pages/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (input) {
                if(input.isEmpty){
                  return 'Silahkan isi email';
                }
                return null;
              },
              onSaved: (input)=> _email = input,
              decoration: InputDecoration(
                labelText: 'Email'
              ),
            ),
            TextFormField(
              validator: (input) {
                if(input.length<6){
                  return 'Password harus diatas 6 karakter';
                }
                return null;
              },
              onSaved: (input)=> _password = input,
              decoration: InputDecoration(
                  labelText: 'Password',
              ),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: signIn,
              child: Text('Sign In'),
            )
          ],
        ),
      ),
    );
  }
  Future<void> signIn() async{
    //memvalidasi isian
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      //login ke firebase
      try{
      FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)).user;
      //return user.uid;
      // Menuju halaman Home
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(user: user)));
      }catch(e){
        print(e.message);
      }
    }

  }
}
