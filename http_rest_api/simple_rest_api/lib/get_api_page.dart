import 'package:brasil_fields/brasil_fields.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_rest_api/cep_model.dart';

class GetApiPage extends StatefulWidget {
  const GetApiPage({
    Key? key,
  }) : super(key: key);

  @override
  State<GetApiPage> createState() => _GetApiPageState();
}

class _GetApiPageState extends State<GetApiPage> {
  FocusNode cepFocusNode = FocusNode();
  final cepController = TextEditingController();

  CepModel? cepModel;

  Future<CepModel?> getInfoByCep() async {
    try {
      String cep = cepController.text.replaceAll(RegExp('[^0-9]'), '');

      if (cep.length == 8) {
        var url = 'https://viacep.com.br/ws/89066698/json/';

        final response = await Dio().get(url);
        if (response.data['erro'] != "true") {
          return cepModel = CepModel.fromMap(response.data);
        }
        cepModel = null;
      }
    } catch (e) {
      print('Deu erro $e');
    } finally {
      setState(() {});
    }
    return null;
  }
  //Primeiro vejo os dados que virão
  //Crio o modelo das informações
  //Então faço o view usando o modelo com mock
  //Depois faço a implementação da requisiçãp
  //Depois testo para ver se os dados chegam
  //Depois conecto na view

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          'Get Resquests',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      'Digite o cep que deseja procurar',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade500),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextField(
                    focusNode: cepFocusNode,
                    controller: cepController,
                    decoration: InputDecoration(
                      hintText: 'Coloque seu cep',
                      labelText: 'Cep',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CepInputFormatter(),
                    ],
                  ),
                  const SizedBox(height: 30),
                  FutureBuilder(
                    future: getInfoByCep(),
                    builder: (context, AsyncSnapshot<CepModel?> snapshot) {
                      if (snapshot.data == null) {
                        return const Text('Nenhum resultado ainda. ');
                      }
                      cepModel = snapshot.data;
                      return Card(
                        color: Colors.grey.shade100,
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(
                            width: 2,
                            color: Colors.pink.shade700,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 27,
                                    backgroundColor: Colors.pink.shade700,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 25,
                                      child: Icon(
                                        Icons.home_work_outlined,
                                        size: 35,
                                        color: Colors.purple.shade900,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Meu endereço',
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purple.shade900,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${cepModel!.logradouro}, ${cepModel!.bairro}, ${cepModel!.localidade}',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey.shade600,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          cepModel!.cep.toString(),
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey.shade600,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.pink,
                                    radius: 30,
                                    child: Text(
                                      cepModel!.uf.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getInfoByCep();
          cepController.clear();
          cepFocusNode.unfocus();
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
