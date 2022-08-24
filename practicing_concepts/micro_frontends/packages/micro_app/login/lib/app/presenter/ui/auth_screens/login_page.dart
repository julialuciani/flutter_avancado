import 'package:core/core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const route = 'login-page';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controllerEmail = TextEditingController();

  final controllerPassword = TextEditingController();

  final focusEmail = TextEditingController();

  final focusPassword = FocusNode();

  final loginPageFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        title: const Text(
          'Login',
          style: TextStyle(letterSpacing: 3),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Text(
                'Please enter with your existing account',
                style: TextStyle(
                  letterSpacing: 3,
                  color: Colors.grey.shade400,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Form(
                key: loginPageFormKey,
                // autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    TextFieldApp(
                      nextFocus: focusPassword,
                      hintText: 'Enter your email',
                      labelText: 'email',
                      controller: controllerEmail,
                      textfieldKey: 'emailLoginPage',
                      validate: (value) {
                        if (!value!.contains('@') || !value!.contains('.com')) {
                          return 'email must be valid';
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    TextFieldApp(
                      nowFocus: focusPassword,
                      hintText: 'Enter your password',
                      labelText: 'password',
                      controller: controllerPassword,
                      textfieldKey: 'passwordLoginPage',
                      validate: (value) {
                        if (value!.length <= 6) {
                          return 'password must be longer than 6 characters';
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.pink.shade100),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (loginPageFormKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Sucess!')),
                        );
                        Navigator.of(context).pushNamed('/home');
                      }
                    },
                    key: const Key('text_button_login'),
                    child: const Text('Login'),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.pink.shade100),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/sign-up');
                    },
                    key: const Key('text_button_signup'),
                    child: const Text('Sign up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
