import 'dart:io';

import 'package:flutter/material.dart';

import 'create_model.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final model = CreateModel();

  final _titleTextController = TextEditingController();

  File? _image;

  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _titleTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('새 게시물'),
        actions: [
          IconButton(
            onPressed: () async {
              //이미지 피커 실행
              if (_image != null && _titleTextController.text.isNotEmpty) {
                setState(() {
                  isLoading = true;
                });

                await model.uploadPost(
                  _titleTextController.text,
                  _image!,
                );

                setState(() {
                  isLoading = false;
                });
                if(mounted) {
                  Navigator.pop(context);
                }
              }
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _titleTextController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "제목을 입력하세요.",
                    fillColor: Colors.white70),
              ),
              const SizedBox(height: 20),
              if(isLoading)
                const CircularProgressIndicator(),
              ElevatedButton(
                  onPressed: () async {
                    _image = await model.getImage();

                    //화면 갱신
                    setState(() {});
                  },
                  child: const Text('이미지 선택')),
              if (_image != null) Image.file(_image!, width: 300),
            ],
          ),
        ),
      ),
    );
  }
}
