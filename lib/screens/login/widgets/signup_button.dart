import 'package:flutter/material.dart';
import 'package:give_me_gifs/screens/home/gif_page.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(top: 150),
      onPressed: (){

      },
      child: Text("Nao possui uma conta? Cadastre-se!",
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: FontWeight.w300,
        color: Colors.white,
        fontSize: 12,
        letterSpacing: 0.5,
      ),
      ),
    );
  }
}
