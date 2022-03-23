import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_search/Photo.dart';
import 'package:image_search/ui/data/pixabay_api.dart';
import 'package:image_search/ui/data/photo_provider.dart';
import 'package:image_search/ui/widget/photo_widget.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = PhotoProvider.of(context)?.viewModel;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "이미지 검색 앱",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                suffixIcon: IconButton(
                    onPressed: () async {
                      viewModel?.fetch(_controller.text);
                    },
                    icon: const Icon(Icons.search)),
              ),
            ),
          ),
          StreamBuilder<Object>(
            stream: viewModel?.photoStream,
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return const CircularProgressIndicator();
              }
              final photos = (snapshot.data as List<Photo>);
              return Expanded(
                child: GridView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: photos.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16),
                    itemBuilder: (context, index) {
                      final photo = photos[index];
                      return PhotoWidget(
                        photo: photo,
                      );
                    }),
              );
            }
          )
        ],
      ),
    );
  }
}
