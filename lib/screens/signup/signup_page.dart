import 'package:flutter/material.dart';
import 'package:give_me_gifs/screens/login/login_screen.dart';
import 'package:give_me_gifs/screens/signup/widgets/animation_button.dart';


class SignUpPage extends StatefulWidget {


  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with SingleTickerProviderStateMixin{

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
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(35, 36, 59, 1),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50,left: 15, right: 15),
        color:Color.fromRGBO(35, 36, 59, 1),
        child: Form(
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: "E-mail",),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(hintText: "Senha",),
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              AnimationButtonSignUp(
                controller: _animationController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
