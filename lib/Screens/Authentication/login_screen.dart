import 'package:flutter/material.dart';
import 'package:social/Screens/Authentication/register_screen.dart';
import 'package:social/widgets/button.dart';
import 'package:social/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.1,
              // ),
              Image.asset(
                'assets/walkie_logo_text.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              textInputField(
                  controller: _emailController,
                  hintText: "enter email",
                  inputKeyboardType: TextInputType.emailAddress,
                  isPassword: false),

              const SizedBox(
                height: 20,
              ),

              textInputField(
                  controller: _passwordController,
                  hintText: "enter password",
                  inputKeyboardType: TextInputType.text,
                  isPassword: true),
              const SizedBox(
                height: 20,
              ),

              SubmitButton(text: 'log in', onPressed: () {}),
              const SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "don't have an account",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "register here!",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
