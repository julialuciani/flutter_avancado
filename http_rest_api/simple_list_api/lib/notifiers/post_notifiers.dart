import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_list_api/repositories/posts_repositorys.dart';

import '../models/post_model.dart';

class PostNotifier extends StateNotifier<List<PostModel>>{
  PostNotifier() : super([]){
    getAllPosts();
  }

  final _repository = PostRepository(Dio());

  getAllPosts() async{
  state = await _repository.getAllPosts();
  }
  
}