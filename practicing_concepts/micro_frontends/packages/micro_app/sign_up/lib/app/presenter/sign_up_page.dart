import 'package:core/core.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final cellphoneController = TextEditingController();
  final cpfController = TextEditingController();
  final cepController = TextEditingController();
  final adressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  SignUpPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> signupPageFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        automaticallyImplyLeading: false,
        title: const Text(
          'Sign Up',
          style: TextStyle(letterSpacing: 3),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Make your account",
                style: TextStyle(
                  letterSpacing: 3,
                  color: Colors.grey.shade400,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFieldApp(
                      labelText: "Name",
                      hintText: "Write your name",
                      controller: nameController,
                      textfieldKey: 'name_field_signup',
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    TextFieldApp(
                      labelText: "Email",
                      hintText: "Write your email",
                      controller: emailController,
                      textfieldKey: 'email_field_signup',
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    TextFieldApp(
                      labelText: "Phone",
                      hintText: "cellphone",
                      controller: cellphoneController,
                      textfieldKey: 'cellphone_field_signup',
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    TextFieldApp(
                      labelText: "CPF",
                      hintText: "CPF",
                      controller: cpfController,
                      textfieldKey: 'cpf_field_signup',
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    TextFieldApp(
                      labelText: "CEP",
                      hintText: "CEP",
                      controller: cepController,
                      textfieldKey: 'cep_field_signup',
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    TextFieldApp(
                      labelText: "Address",
                      hintText: "Address",
                      controller: adressController,
                      textfieldKey: 'addresse_field_signup',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Text(
                        "Password: ",
                        style: TextStyle(
                          letterSpacing: 3,
                          color: Colors.grey.shade400,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    TextFieldApp(
                      labelText: "Password",
                      hintText: "Enter your password",
                      controller: passwordController,
                      textfieldKey: 'password_field_signup',
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    TextFieldApp(
                      labelText: "Confirm Password",
                      hintText: "Please confirm you password",
                      controller: confirmPasswordController,
                      textfieldKey: 'confirm_password_field_signup',
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
