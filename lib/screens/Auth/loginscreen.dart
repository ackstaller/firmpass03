import 'package:flutter/material.dart';
import 'package:my_app/components/login_textfield.dart';
import 'package:my_app/components/my_button.dart';
import 'package:my_app/screens/home_screen.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              /*SizedBox(
                width: 100,
                height: 100,
                child:
                    Image.asset("assets/images/image.png"), //TODO Schönes Foto!
              ),*/
              const SizedBox(height: 50),
              // welcome back, you've been missed!
              Text(
                'Login',
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 22,
                    fontWeight: FontWeight.w400),
              ),

              const SizedBox(height: 25),

              // username textfield
              LoginTextField(
                controller: usernameController,
                hintText: 'NUTZERNAME',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              LoginTextField(
                controller: passwordController,
                hintText: 'PASSWORT',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              const SizedBox(height: 25),

              // sign in button
              MyButton(
                onTap: () async {
                  //Loginfunction
                },
              ),

              const SizedBox(height: 50),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
