import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sistem_absensi/Setup/signIn.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
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
              onPressed: signUp,
              child: Text('Sign Up'),
            )
          ],
        ),
      ),
    );
  }
void signUp() async{
    //memvalidasi isian
    final formState = _formKey.currentState;
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        FirebaseUser user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password)).user;
        user.sendEmailVerification();
        //Menampilkan pesan bahwa aplikasi mengirim email
        Navigator.of(context).pop();
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
      }catch(e){
        print(e.message);
      }
    }
  }
}
