import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/detail_post/detail_post_page.dart';
import 'package:instagram_clone/tab/search/search_model.dart';

import '../../create/create_page.dart';
import '../../domain/post.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  final List<String> _urls = const [
    'https://www.coindeskkorea.com/news/photo/201808/20180817_1_27061.jpg',
    'https://mblogthumb-phinf.pstatic.net/20160804_86/hamebio_14702574205290RfTA_PNG/hookah-tobacco-white-peach.png?type=w2',
    'https://kormedi.com/wp-content/uploads/2022/07/gettyimages-636739764.jpg',
    'https://www.amoskorea.co.kr/__DATA/Product/2016/07/25/c5c4449a548796666d3b774a178cf37a'
  ];

  @override
  Widget build(BuildContext context) {
    final model = SearchModel();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreatePage()));
        },
        child: const Icon(Icons.create),
      ),
      appBar: AppBar(
        title: const Text('Instagram clone'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: StreamBuilder<QuerySnapshot<Post>>(
            stream: model.postsStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('알 수 없는 에러');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              List<Post> posts =
                  snapshot.data!.docs.map((e) => e.data()).toList();
              return GridView.builder(
                itemCount: posts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 2.0,
                  crossAxisSpacing: 2.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final post = posts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPostPage(post: post)),
                      );
                    },
                    child: Hero(
                      tag: post.id,
                      child: Image.network(
                        post.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
