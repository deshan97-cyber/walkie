import 'package:flutter/material.dart';
import 'package:social/Screens/Authentication/login_screen.dart';
import 'package:social/utills/colors.dart';
import 'package:social/widgets/button.dart';
import 'package:social/widgets/text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/walkie_logo_text.png',
                height: 60,
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: secondaryColor,
                    backgroundImage: NetworkImage(
                        'https://1fid.com/wp-content/uploads/2022/06/cartoon-profile-picture-12-1024x1024.jpg'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(179, 29, 29, 29),
                          borderRadius: BorderRadiusDirectional.circular(30)),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_a_photo,
                          color: Colors.yellow.shade600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              textInputField(
                  controller: _usernameController,
                  hintText: 'enter an username',
                  inputKeyboardType: TextInputType.text,
                  isPassword: false),
              const SizedBox(
                height: 30,
              ),
              textInputField(
                  controller: _emailController,
                  hintText: 'enter an email',
                  inputKeyboardType: TextInputType.emailAddress,
                  isPassword: false),
              const SizedBox(
                height: 30,
              ),
              textInputField(
                  controller: _bioController,
                  hintText: 'enter a bio',
                  inputKeyboardType: TextInputType.text,
                  isPassword: false),
              const SizedBox(
                height: 30,
              ),
              textInputField(
                  controller: _passwordController,
                  hintText: 'enter a password',
                  inputKeyboardType: TextInputType.text,
                  isPassword: true),
              const SizedBox(
                height: 30,
              ),
              SubmitButton(text: 'register', onPressed: () {}),
              const SizedBox(
                height: 0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "already have an account",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "log in",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
