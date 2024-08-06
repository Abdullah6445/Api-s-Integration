import 'package:api_integration/user_apis/user_api_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class UserApiVU extends StackedView<UserApiVM> {
  @override
  Widget builder(BuildContext context, UserApiVM viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Api MOdel"),
      ),
      body: FutureBuilder(
        future: viewModel.fetchUserInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemBuilder: (context, index) {
                  return viewModel.userModelListObj.length <= 10
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * .27,
                            width: double.infinity,
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: Colors.grey.shade300,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius:
                                            MediaQuery.sizeOf(context).height *
                                                .02,
                                        child: Text(
                                          viewModel.userModelListObj[index].id
                                              .toString(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Name: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            viewModel
                                                .userModelListObj[index].name,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Email: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            viewModel
                                                .userModelListObj[index].email,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Phone: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            viewModel
                                                .userModelListObj[index].phone,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Website: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            viewModel.userModelListObj[index]
                                                .website,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Address:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(viewModel.userModelListObj[index]
                                              .address.street),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "ZipCode: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(viewModel.userModelListObj[index]
                                              .address.zipcode),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Company Name: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(viewModel.userModelListObj[index]
                                              .company.name),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "bs: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(viewModel.userModelListObj[index]
                                              .company.bs),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : null;
                },
                itemCount: viewModel.userModelListObj.length);
          } else {
            return Center(child: const CircularProgressIndicator());
          }
        },
      ),
    );
  }

  @override
  UserApiVM viewModelBuilder(BuildContext context) {
    return UserApiVM();
  }
}
