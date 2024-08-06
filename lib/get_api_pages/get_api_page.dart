import 'dart:convert';

import 'package:api_integration/get_api_pages/model_class.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class GetApiPage extends StatefulWidget {
  const GetApiPage({super.key});

  @override
  State<GetApiPage> createState() => _GetApiPageState();
}

class _GetApiPageState extends State<GetApiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Api"),
      ),
      body: FutureBuilder(
        future: fetchPostApiData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                        child: Text(modelClassObj[index].id.toString())),
                    title: Text(modelClassObj[index].title),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: modelClassObj.length);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  List<ModelClass> modelClassObj = [];

  Future<List<ModelClass>> fetchPostApiData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/'));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        modelClassObj.add(ModelClass.fromJson(index));
      }
      return modelClassObj;
    } else {
      return modelClassObj;
    }
  }
}
