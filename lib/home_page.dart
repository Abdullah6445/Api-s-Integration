import 'package:api_integration/calling_apis/calling_api.dart';
import 'package:api_integration/get_api_pages/get_api_page.dart';
import 'package:api_integration/pages/post_api/post_api_integration.dart';
import 'package:api_integration/user_apis/user_api_vu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calling different Apis"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CallingApi(),
                      ));
                },
                child: Text("Albums Api")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostApiIntegration(),
                      ));
                },
                child: Text("Posts Api")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GetApiPage(),
                      ));
                },
                child: Text("Api")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserApiVU(),
                      ));
                },
                child: Text("Users Api")),
          ],
        ),
      ),
    );
  }
}
