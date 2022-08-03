import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PostApiPage extends StatefulWidget {
  const PostApiPage({Key? key}) : super(key: key);

  @override
  State<PostApiPage> createState() => _PostApiPageState();
}

class _PostApiPageState extends State<PostApiPage> {
  var baseUrl = 'http://ec2-54-80-244-185.compute-1.amazonaws.com:3333/api';

  Future postLogin() async {
    try {
      String urlLogin = '$baseUrl/v1/auth/login';

      Map<String, dynamic> headers = {
        'accept': 'application/json',
        'Content-Type': 'Application/json'
      };

      Map<String, dynamic> body = {
        'email': 'deveda4217@logodez.com',
        'password': 'Teste@123'
      };

      var response = await Dio().post(
        urlLogin,
        data: body,
        options: Options(
          contentType: Headers.jsonContentType,
          headers: headers,
        ),
      );

      print(response.data);
    } catch (e) {
      print('Deu erro');
    }
  }

  Future deleteInfo() async {
    var url =
        'http://ec2-54-80-244-185.compute-1.amazonaws.com:3333/api/v1/owners/service/557a0a51-017a-44ea-8931-594083c0f150';
    var response = await Dio().delete(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Requests'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MaterialButton(
              color: Colors.pink,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: const BorderSide(width: 1)),
              onPressed: () {
                postLogin();
              },
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
