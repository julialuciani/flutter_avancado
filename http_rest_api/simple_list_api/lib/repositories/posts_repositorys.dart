import 'package:dio/dio.dart';
import 'package:simple_list_api/models/post_model.dart';

class PostRepository {
  final Dio dio;

  PostRepository(this.dio);

  Future<List<PostModel>> getAllPosts() async {
    List<PostModel> posts = [];
try{
final response =
        await dio.get('https://jsonplaceholder.typicode.com/posts');

    posts = List.from(
      response.data.map(
        (post) {
          return PostModel.fromMap(post);
        },
      ),
    );
} catch (e){
  print('Deu erro $e');
}
    
    return posts;
  }
}
