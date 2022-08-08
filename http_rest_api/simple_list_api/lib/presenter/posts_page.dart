import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_list_api/providers/post_providers.dart';

class PostsPage extends StatefulHookConsumerWidget {
  static const route = '/posts-page';
  const PostsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends ConsumerState<PostsPage> {
  // PostRepository repository = PostRepository(Dio());
  // late Future<List<PostModel>> posts;

  // @override
  // void initState() {
  //   posts = repository.getAllPosts();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final posts = ref.watch(postProvider);

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
        child: Visibility(
          visible: posts.isNotEmpty,
          replacement: const CircularProgressIndicator(),
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                color: Colors.grey.shade100,
                child: ListTile(
                  title: Text(posts[index].title),
                  subtitle: Text(posts[index].body),
                ),
              );
            },
          ),
        ),
        // child: FutureBuilder(
        //   future: posts,
        //   builder: (context, AsyncSnapshot<List<PostModel>>snapshot) {
        //     if (snapshot.hasData){
        //       return ListView.builder(
        //         itemCount: snapshot.data!.length,
        //         itemBuilder: (context, index) {
        //           PostModel post = snapshot.data![index];
        //           return Text(post.title);
        //         },
        //       );
        //     }
        //     return const CircularProgressIndicator();
        // }),
      ),
    );
  }
}
