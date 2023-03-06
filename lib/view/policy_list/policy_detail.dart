import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../model/policy_model.dart';

class PolicyDetail extends StatefulWidget {
  late List<PolicyModel> policyListdetail;

  PolicyDetail({required this.policyListdetail});

  @override
  State<PolicyDetail> createState() => _PolicyDetailState();
}

class _PolicyDetailState extends State<PolicyDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculate Table'),
        ),
        body: Center(
            child: Column(children: <Widget>[
          Card(
            margin: EdgeInsets.only(top: 30),
            child: Container(
              child: Table(
                defaultColumnWidth: FixedColumnWidth(80.0),
                border: TableBorder.all(
                    color: Colors.black, style: BorderStyle.solid, width: 2),
                children: [
                  TableRow(children: [
                    Column(children: [
                      Text('Date', style: TextStyle(fontSize: 20.0))
                    ]),
                    Column(children: [
                      Text('Days', style: TextStyle(fontSize: 20.0))
                    ]),
                    Column(children: [
                      Text('Dprice', style: TextStyle(fontSize: 20.0))
                    ]),
                    Column(children: [
                      Text('Mprice', style: TextStyle(fontSize: 20.0))
                    ]),
                  ]),
                  tableRow(1),
                  tableRow(2),
                  tableRow(3),
                  tableRow(4),
                  tableRow(5),
                  tableRow(6),
                  tableRow(7),
                  tableRow(8),
                  tableRow(9),
                  tableRow(10),
                  tableRow(11),
                ],
              ),
            ),
          ),
        ])));
  }

  TableRow tableRow(int i) {
    return TableRow(children: [
      Column(
          children: [Text(widget.policyListdetail[i].policyDate.toString())]),
      Column(children: [Text(widget.policyListdetail[i].day.toString())]),
      Column(
          children: [Text(widget.policyListdetail[i].dailyPrice.toString())]),
      Column(
          children: [Text(widget.policyListdetail[i].monthlyPrice.toString())]),
    ]);
  }
}
