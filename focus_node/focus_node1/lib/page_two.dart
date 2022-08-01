import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static const route = '/page-two';
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  FocusNode focusEmail = FocusNode();
  FocusNode focusCpf = FocusNode();
  FocusNode focusBirthDate = FocusNode();
  FocusNode focusAge = FocusNode();

  final keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: keyForm,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.97,
                color: Colors.blue.shade50,
                child: TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(
                    // border: InputBorder.none,
                    hintText: 'Name',
                    border: OutlineInputBorder(),
                    
                  ),
                  onFieldSubmitted: (value) {
                    focusEmail.requestFocus();
                  },
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                focusNode: focusEmail,
                decoration: const InputDecoration(
                  hintText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
                autovalidateMode: AutovalidateMode.always,
                validator: (value) {
                  if (value!.length < 6) {
                    return 'O email precisa ter mais do que 5 caracteres';
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  focusCpf.requestFocus();
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                focusNode: focusCpf,
                decoration: const InputDecoration(
                  hintText: 'CPF',
                  border: OutlineInputBorder(),
                ),
                onFieldSubmitted: (value) {
                  focusBirthDate.requestFocus();
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                focusNode: focusBirthDate,
                decoration: const InputDecoration(
                  hintText: 'BirthDate',
                  border: OutlineInputBorder(),
                ),
                onFieldSubmitted: (value) {
                  focusAge.requestFocus();
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                focusNode: focusAge,
                decoration: const InputDecoration(
                  hintText: 'Age',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (keyForm.currentState!.validate()) {
                    print('Tá validado');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.white,
                        dismissDirection: DismissDirection.startToEnd,
                        content: Text(
                          'Você precisa preencher os dados corretamente',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Finalizar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
