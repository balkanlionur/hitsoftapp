import 'package:flutter/material.dart';
import 'package:hitsoft/view/policy_list/policy_detail.dart';

import 'package:intl/intl.dart';

import '../../model/policy_list_view_model.dart';

class PolicyListView extends PolicyListViewModel {
  TextEditingController policyDate = TextEditingController();
  int isradio = 0;
  int policyprice = 0;
  int policyday = 0;

  late List date_installment;

  void initState() {
    policyDate.text = " ";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        title: Text('Policy Page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text(">"),
        onPressed: () {
          getpolicyList();

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PolicyDetail(
                        policyListdetail: policyList,
                      )));
        },
      ),
      body: Column(
        children: [
          Card(
            color: Colors.white70,
            margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
            elevation: 10,
            child: Wrap(children: [
              TextField(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    print(pickedDate);

                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);

                    String formatDateMont = DateFormat('MM').format(pickedDate);

                    print(formatDateMont);

                    print(formattedDate);

                    setState(() {
                      policyDate.text = formattedDate;
                    });
                  } else {}
                },
                readOnly: true,
                controller: policyDate,
                onChanged: (value) {},
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    hintText: ' Policy Date',
                    border: OutlineInputBorder()),
              ),
            ]),
          ),
          Card(
            color: Colors.white70,
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            elevation: 10,
            child: Wrap(children: [
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  policyprice = int.parse(value);
                  //policyModel.day = int.tryParse(value);
                },
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    hintText: ' Policy Price',
                    border: OutlineInputBorder()),
              ),
            ]),
          ),
          Card(
            color: Colors.white70,
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            elevation: 10,
            child: Wrap(children: [
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  policyday = int.parse(value);
                },
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    hintText: ' Policy Day',
                    border: OutlineInputBorder()),
              ),
            ]),
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              RadioListTile(
                tileColor: Colors.white70,
                title: const Text("Daily"),
                value: 0,
                groupValue: isradio,
                onChanged: (value) {
                  setState(() {
                    isradio = 0;
                    print(isradio);
                  });
                },
              ),
              RadioListTile(
                tileColor: Colors.white70,
                title: const Text("Monthly"),
                value: 1,
                groupValue: isradio,
                onChanged: (value) {
                  setState(() {
                    isradio = 1;

                    print(isradio);
                  });
                },
              ),
            ],
          ),
          ElevatedButton(onPressed: calculater, child: const Text('Calculate')),
          ElevatedButton(onPressed: () {}, child: const Text('Save')),
        ],
      ),
    );
  }

  void calculater() {
    policyModel.docnum = 1;
    /* print(isradio);
    print(policyprice);
    print(policyday);*/
    for (var i = 0; i < policyday; i++) {
      DateTime lasttime =
          DateTime(DateTime.now().year, DateTime.now().month + i, 1)
              .add(const Duration(days: -1));

      String lastday = DateFormat('dd').format(lasttime);
      String lastdateformat = DateFormat('yyyy-MM-dd').format(lasttime);

      double dayprice = policyprice / 365 * int.parse(lastday);
      double monthprice = policyprice / 12;

      policyModel.policyDate = lastdateformat.toString();
      policyModel.day = int.parse(lastday);
      policyModel.dailyPrice = dayprice.round();
      policyModel.monthlyPrice = monthprice.round();

      saveModel();

      print(policyModel.policyDate);
      print(policyModel.day);
      print(policyModel.dailyPrice);
      print(policyModel.monthlyPrice);
    }
    getpolicyList();
  }
}
