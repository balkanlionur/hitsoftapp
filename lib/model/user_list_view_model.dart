import 'package:flutter/material.dart';
import 'package:hitsoft/model/user_model.dart';

import '../provider/user_view_provider.dart';
import '../view/user_list/user_list.dart';

class UserListViewModel extends State<UserList> {
  late UserDatabseProvider userDatabseProvider;

  UserModel userModel = UserModel();

  List<UserModel> userList = [];

  Future getuserList() async {
    userList = await userDatabseProvider.getList();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userDatabseProvider = UserDatabseProvider();
    userDatabseProvider.open();
  }

  Future<void> saveModel() async {
    final result = await userDatabseProvider.insert(userModel);
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
