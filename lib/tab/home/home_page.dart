import 'package:flutter/material.dart';

import 'home_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final model = HomeModel();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram clone'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text('Instagram 에 오신 것을 환영합니다.',
                style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            const Text('사진과 동영상을 보려면 팔로우하세요.'),
            const SizedBox(height: 20),
            Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: GestureDetector(
                        onTap: () async {
                          await model.updateProfileImage();

                          setState(() {});
                        },
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(model.getProfileImageUrl()),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(model.getEmail(),
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(model.getNickName()),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                            'https://mblogthumb-phinf.pstatic.net/20160804_86/hamebio_14702574205290RfTA_PNG/hookah-tobacco-white-peach.png?type=w2',
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover),
                        const SizedBox(width: 4),
                        Image.network(
                            'https://kormedi.com/wp-content/uploads/2022/07/gettyimages-636739764.jpg',
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover),
                        const SizedBox(width: 4),
                        Image.network(
                            'http://kormedi.com/wp-content/uploads/2020/02/gettyimages-973261478-580x580.jpg',
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover),
                        const SizedBox(width: 4),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text('facebook 친구'),
                    const SizedBox(height: 8),
                    ElevatedButton(onPressed: () {}, child: const Text('팔로우'))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
