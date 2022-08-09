import 'package:flutter/material.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({Key? key}) : super(key: key);

  static const route = 'practice-page';
  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  FocusNode focusName = FocusNode();
  FocusNode focusAddress = FocusNode();
  FocusNode focusAge = FocusNode();

  TextEditingController controllerAddress = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerAge = TextEditingController();

  final keyForm = GlobalKey<FormState>(); //First we create the global key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Practice',
            style: TextStyle(letterSpacing: 3),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text(
              'Usando focus node e validadores nos TextFormFields',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade500),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                //Then we create a forms
                key: keyForm, //The key will be the global key
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    TextFormField(
                      controller: controllerName,
                      autofocus: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                          hintText: 'Name'),
                      autovalidateMode: AutovalidateMode.always,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Este campo é obrigatório';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        focusAddress.requestFocus();
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    TextFormField(
                      controller: controllerAddress,
                      focusNode: focusAddress,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Address',
                        hintText: 'Address',
                      ),
                      autovalidateMode: AutovalidateMode.always,
                      validator: (value) {
                        if (value!.length < 5) {
                          return 'Este campo precisa conter mais do que 5 caracteres';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        focusAge.requestFocus();
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    TextFormField(
                      controller: controllerAge,
                      focusNode: focusAge,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Age',
                        hintText: 'Age',
                      ),
                      autovalidateMode: AutovalidateMode.always,
                      validator: (value) {
                        int age = int.tryParse(controllerAge.text) ?? 0;
                        if (age < 18) {
                          return 'Você precisa ter pelo menos 18 anos para se inscrever';
                        } else if (age >= 100) {
                          return 'Nossa você é muito velho';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ]
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (keyForm.currentState!.validate()) {
             ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.pink,
                  dismissDirection: DismissDirection.up,
                  content: Text(
                    'Tudo certo, inscrição feita',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.pink,
                  dismissDirection: DismissDirection.up,
                  content: Text(
                    'Preencha seus dados corretamente!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }
          },
          child: const Icon(Icons.done_all_outlined),
        ));
  }
}
