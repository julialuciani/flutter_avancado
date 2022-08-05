import 'package:dio/dio.dart';


class TextRepository {
  final Dio dio;

  TextRepository(this.dio);

  Future<bool> postTexts() async {
    bool result = false;

    try {
      var data = {
        "userId": 1,
        "id": 1,
        "title":
            "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body":
            "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
      };

      final response = await dio
          .post('https://jsonplaceholder.typicode.com/posts', data: data);
      print(response.data);
      if (response.statusCode == true){
        result = true;
      }
      print('Tudo certo');
    } catch (e) {
      print('Deu erro $e');
    }

  return result;
  }
}
