import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:simple_list_api/models/post_model.dart';
import 'package:simple_list_api/repositories/posts_repositorys.dart';

class PostsPage extends StatefulWidget {
  static const route = '/posts-page';
  const PostsPage({Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  PostRepository repository = PostRepository(Dio());
  late Future<List<PostModel>> posts;

  @override
  void initState() {
    posts = repository.getAllPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.heart_broken,
            size: 30,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.pink.shade100,
        title: const Text(
          'Random list',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: posts,
          builder: (context, AsyncSnapshot<List<PostModel>>snapshot) {
            if (snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  PostModel post = snapshot.data![index];
                  return Text(post.title);
                },
              );
            }
            return const CircularProgressIndicator();
        }),
      ),
    );
  }
}
