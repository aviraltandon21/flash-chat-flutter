//import 'package:flash_chat/components/rounded_button.dart';
//import 'package:flash_chat/screens/login_screen.dart';
//import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flutter/material.dart';


class ResetPassword extends StatefulWidget {
  static const String id = 'reset_password';
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  final RelativeRectTween _relativeRectTween = RelativeRectTween(
    begin: RelativeRect.fromLTRB(24, 24, 24, 200),
    end: RelativeRect.fromLTRB(24, 24, 24, 250),
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3))
      ..repeat(reverse: true);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color(0xffd8f3dc),
      body: Stack(
        children: [
          PositionedTransition(
            rect: _relativeRectTween.animate(_controller),
            child: Container(
              child: Image.asset('images/brain.png'),
            ),
          ),

          Positioned(
            top: 150,
            bottom: 0,
            left: 24,
            right: 24,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                SizedBox(
                  height: 60.0,
                ),
                 Text(
                  'Yipeee !!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 45.0,
                      letterSpacing: 2,
                      color: const Color(0xff2f3640),
                      fontFamily: 'Anton',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25.0,
                ),

                Text(
                  'Password Reset Link has been sent to your registered Email-id',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: const Color(0xff2f3640),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                RoundedButton(
                  title: 'Back to Login',
                  colour: Colors.lightBlueAccent,
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}
