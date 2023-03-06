import 'package:flutter/material.dart';
import 'package:hitsoft/view/policy_list/policy_list.dart';
import 'package:hitsoft/view/user_list/user_detail.dart';
import 'package:intl/intl.dart';

import '../../model/user_list_view_model.dart';

class UserListView extends UserListViewModel {
  String dropdownValue = 'Sigorta';

  TextEditingController dateBegin = TextEditingController();
  TextEditingController dateEnd = TextEditingController();

  int isradio = 1;

  void initState() {
    dateBegin.text = " ";
    dateEnd.text = " ";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      floatingActionButton: FloatingActionButton(
        child: Text('>'),
        onPressed: () {
          getuserList();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PolicyList()));
        },
      ),
      body: Card(
        color: Colors.white70,
        margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
        elevation: 10,
        child: Wrap(
          runSpacing: 5,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 30),
                  child: SizedBox(
                    width: 150,
                    child: TextField(
                      onChanged: (value) {
                        userModel.cardName = value;
                      },
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                          hintText: ' User Name',
                          border: OutlineInputBorder()),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 30),
                  child: SizedBox(
                    width: 150,
                    child: TextField(
                      onChanged: (value) {
                        userModel.cardLastName = value;
                      },
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                          hintText: ' Last Name',
                          border: OutlineInputBorder()),
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                userModel.polciyNum = int.tryParse(value);
              },
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  hintText: ' Polciy Number',
                  border: OutlineInputBorder()),
            ),
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
                  print(formattedDate);
                  setState(() {
                    dateBegin.text = formattedDate;
                  });
                } else {}
              },
              readOnly: true,
              controller: dateBegin,
              onChanged: (value) {
                userModel.policyBegDate = value;
              },
              decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  hintText: ' PolicyBegin Date',
                  border: OutlineInputBorder()),
            ),

            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                userModel.installmentNo = int.tryParse(value);
              },
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  hintText: ' Installment No',
                  border: OutlineInputBorder()),
            ),
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
                  print(formattedDate);
                  setState(() {
                    dateEnd.text = formattedDate;
                  });
                } else {}
              },
              readOnly: true,
              controller: dateEnd,
              onChanged: (value) {
                userModel.policyEndDate = value;
              },
              decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  hintText: ' PolicyEnd Date',
                  border: OutlineInputBorder()),
            ),

            TextField(
              onChanged: (value) {
                userModel.comments = value;
              },
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  hintText: ' Comments',
                  border: OutlineInputBorder()),
            ),

            /* TextField(
              onChanged: (value) {
                userModel.methodology = int.tryParse(value);
              },
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  hintText: ' Methodology',
                  border: OutlineInputBorder()),
            ),*/
            const SizedBox(
              height: 50,
            ),
            // Step 2.
            Center(child: SizedBox(width: 200, child: dropExpense())),

            Center(
              child: ElevatedButton(
                  onPressed: () {
                    saveModel();
                  },
                  child: const Text('Save')),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    getuserList();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserDetail(
                                  userListdetail: userList,
                                )));
                  },
                  child: const Text('Detail Page')),
            ),
          ],
        ),
      ),
    );
  }

  TextField datePicker(BuildContext context, int isbegindate) {
    return TextField(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime(2100));

        if (pickedDate != null) {
          print(pickedDate);

          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          print(formattedDate);
          setState(() {
            if (isbegindate == 1) {
              dateBegin.text = formattedDate;
            } else {
              dateEnd.text = formattedDate;
            }
          });
        } else {}
      },
      readOnly: true,
      controller: dateBegin,
      onChanged: (value) {
        if (isbegindate == 1) {
          userModel.policyBegDate = value;
        } else {
          userModel.policyEndDate = value;
        }
      },
      decoration: const InputDecoration(
          icon: Icon(Icons.calendar_today),
          contentPadding: EdgeInsets.symmetric(vertical: 0),
          hintText: ' PolicyBegin Date',
          border: OutlineInputBorder()),
    );
  }

  DropdownButtonFormField<String> dropExpense() {
    return DropdownButtonFormField<String>(
      value: dropdownValue,
      items: <String>['Sigorta', 'Kasko', 'Kira']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(fontSize: 15),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
    );
  }
}
