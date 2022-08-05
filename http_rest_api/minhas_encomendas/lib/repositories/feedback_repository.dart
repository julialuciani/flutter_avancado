import 'package:dio/dio.dart';

class FeedbackRepository {
  final Dio dio;

  FeedbackRepository(this.dio);

  Future<bool> postFeedbacks() async {
   bool sucess = false;

    try {
    var data = {
      "feedbackType": "General",
      "feedback": "string",
      "entityId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
    };

    final response =
        await dio.post('https://wizard-world-api.herokuapp.com/Feedback', data: data);
    print(response.data);
    if (response.statusCode == true){
      sucess = true;
    }
    print('Tudo ok');


    } catch (e) {
      print('Deu erro $e');
    }
    return sucess;
  }
}
