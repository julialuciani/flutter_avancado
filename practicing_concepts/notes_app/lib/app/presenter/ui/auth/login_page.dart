import 'package:flutter/material.dart';
import 'package:notes_app/app/presenter/ui/home_page.dart';

import '../../../../shared/widgets/textfield_app.dart';

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
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    TextFieldApp(
                      nextFocus: focusPassword,
                      hintText: 'Enter your email',
                      labelText: 'email',
                      controller: controllerEmail,
                      textfieldKey: 'emailLoginPage',
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
                      backgroundColor: Colors.pink.shade200,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.pink.shade100),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(HomePage.route);
                    },
                    child: const Text('Submit'),
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
