import 'dart:convert';

import 'package:api_integration/calling_apis/model_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CallingApi extends StatefulWidget {
  const CallingApi({super.key});

  @override
  State<CallingApi> createState() => _CallingApiState();
}

class _CallingApiState extends State<CallingApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("calling api"),
      ),
      body: FutureBuilder(
        future: callingApiFunction(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                        child: Text(modelClassListObj[index].id.toString())),
                    title: Text(modelClassListObj[index].title),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: modelClassListObj.length);
          } else {
            return Center(child: const CircularProgressIndicator());
          }
        },
      ),
    );
  }

  List<ModelClassSaqlein> modelClassListObj = [];

  Future<List<ModelClassSaqlein>> callingApiFunction() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/"));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        modelClassListObj.add(ModelClassSaqlein.fromJson(index));
      }
      return modelClassListObj;
    } else {
      return modelClassListObj;
    }
  }
}
