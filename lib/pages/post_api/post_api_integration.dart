import 'dart:convert';

import 'package:api_integration/pages/post_api/post_api_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class PostApiIntegration extends StatefulWidget {
  const PostApiIntegration({super.key});

  @override
  State<PostApiIntegration> createState() => _PostApiIntegrationState();
}

class _PostApiIntegrationState extends State<PostApiIntegration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Api"),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      postApiModelClass[index].title,
                      maxLines: 1,
                    ),
                    subtitle: Text(
                      postApiModelClass[index].body,
                      maxLines: 2,
                    ),
                  );
                },
                itemCount: postApiModelClass.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  List<PostApiModelClass> postApiModelClass = [];

  Future<List<PostApiModelClass>> fetchData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        postApiModelClass.add(PostApiModelClass.fromJson(index));
      }
      return postApiModelClass;
    } else {
      return postApiModelClass;
    }
  }
}
