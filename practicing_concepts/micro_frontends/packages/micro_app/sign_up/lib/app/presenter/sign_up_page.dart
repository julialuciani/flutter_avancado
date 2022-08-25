import 'package:brasil_fields/brasil_fields.dart';
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
                key: signupPageFormKey,
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
                    TextFieldAppEmail(
                      labelText: "Email",
                      hintText: "Write your email",
                      controller: emailController,
                      textfieldKey: 'email_field_signup',
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    TextFieldAppFormatted(
                      labelText: "Cellphone",
                      hintText: "cellphone",
                      controller: cellphoneController,
                      textfieldKey: 'cellphone_field_signup',
                      formater: TelefoneInputFormatter(),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    TextFieldAppFormatted(
                      labelText: "CPF",
                      hintText: "CPF",
                      controller: cpfController,
                      textfieldKey: 'cpf_field_signup',
                      formater: CpfInputFormatter(),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    TextFieldAppFormatted(
                      labelText: "CEP",
                      hintText: "CEP",
                      controller: cepController,
                      textfieldKey: 'cep_field_signup',
                      formater: CepInputFormatter(),
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
                    TextFieldAppConfirmPassword(
                      labelText: "Password",
                      hintText: "Enter your password",
                      controller: passwordController,
                      textfieldKey: 'password_field_signup',
                      icon: Icons.visibility, controllerConfirm: confirmPasswordController,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    TextFieldAppConfirmPassword(
                        labelText: "Confirm Password",
                        hintText: "Please confirm you password",
                        controller: confirmPasswordController,
                        textfieldKey: 'confirm_password_field_signup',
                        controllerConfirm: passwordController,
                        icon: Icons.visibility,
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
                        if (signupPageFormKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Sucess!')),
                          );
                          Navigator.of(context).pushNamed('/home');
                        }
                      },
                      key: const Key('text_button_login'),
                      child: const Text('Login'),
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
