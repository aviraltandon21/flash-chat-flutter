import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/screens/reset_password.dart';
//import 'package:flash_chat/screens/verify_screen.dart';
//import 'package:flash_chat/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter/cupertino.dart';

class ForgotPassword extends StatefulWidget {
  static const String id = 'forgot_password';
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _auth = FirebaseAuth.instance;
  String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 48.0,
                      color: Color.fromARGB(255, 13, 79, 139),
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),

              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 150.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
              keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your email')
              ),
              SizedBox(
                height: 8.0,
              ),
              RoundedButton(
                title: 'Reset Password',
                colour: Colors.blue,
                onPressed: () async {
                  Navigator.pushNamed(context, ResetPassword.id);
                   await resetPassword(email);

                },
              ),
        ],
        ),
      ),
    );
  }
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

}
