import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../model/user_model.dart';

class UserDetail extends StatefulWidget {
  late List<UserModel> userListdetail;

  UserDetail({required this.userListdetail});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: ListView.builder(
        itemCount: widget.userListdetail.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                tileColor: Colors.black12,
                title: Text(
                  widget.userListdetail[index].docnum.toString() +
                      "-" +
                      widget.userListdetail[index].cardName.toString() +
                      " " +
                      widget.userListdetail[index].cardLastName.toString(),
                ),
                subtitle:
                    Text(widget.userListdetail[index].polciyNum.toString())),
          );
        },
      ),
    );
  }
}
