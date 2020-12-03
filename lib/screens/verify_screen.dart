import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/welcome_screen.dart';

class VerifyScreen extends StatefulWidget {
  static const String id = 'verify_screen';
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> with SingleTickerProviderStateMixin {


  AnimationController _controller;
  final RelativeRectTween _relativeRectTween = RelativeRectTween(
      begin: RelativeRect.fromLTRB(24, 24, 24, 200),
      end: RelativeRect.fromLTRB(24, 24, 24, 250),
  );
  final auth = FirebaseAuth.instance;
  User user;
  Timer timer;

  @override
  void initState() {
    user = auth.currentUser;
    user.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
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
              children: const [
                SizedBox(
                  height: 60.0,
                ),
                const Text(
                  'Please wait',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 50,
                      letterSpacing: 2,
                      color: const Color(0xff2f3640),
                      fontFamily: 'Anton',
                      fontWeight: FontWeight.bold),
                ),

                const Text(
                  'An email has been sent for verification',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: const Color(0xff2f3640),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                const Text(
                  'You will be redirected to HomePage',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: const Color(0xff2f3640),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.pushNamed(context, WelcomeScreen.id);
    }
  }
}





