import 'package:flutter/material.dart';
import 'package:give_me_gifs/screens/login/widgets/input_field.dart';

class FormContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        child: Column(
          children: <Widget>[
            // importa a classe inputField com seus campos todos editados e mais organizados
            InputField(
              hint: "Usuário",
              obscure: false,
              icon: Icons.person_outline,
            ),
            InputField(
              hint: "Senha",
              obscure: true,
              icon: Icons.lock,
            ),
          ],
        ),
      ),
    );
  }
}
