import 'package:flutter/material.dart';
import 'package:give_me_gifs/screens/home/gif_page.dart';
import 'package:give_me_gifs/screens/login/widgets/animation_button.dart';
import 'package:give_me_gifs/screens/login/widgets/form_container.dart';
import 'package:give_me_gifs/screens/login/widgets/signup_button.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
      duration: Duration(seconds: 2)
    );
    
    _animationController.addStatusListener((status){
      if(status == AnimationStatus.completed){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => GifPage()));
      }
    });
  }


  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/back1.png'),
            fit: BoxFit.cover
            )
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 50,bottom: 30),
                      child: Image.asset('assets/rainb.png',
                      width: 250,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                    FormContainer(),
                    SignUpButton(),
                  ],
                ),
                AnimationButton(
                  controller: _animationController.view,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

