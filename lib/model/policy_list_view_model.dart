import 'package:flutter/material.dart';
import 'package:hitsoft/model/policy_model.dart';

import '../provider/policy_view_provider.dart';
import '../view/policy_list/policy_list.dart';

class PolicyListViewModel extends State<PolicyList> {
  late PolicyDatabseProvider policyDatabseProvider;

  PolicyModel policyModel = PolicyModel();

  List<PolicyModel> policyList = [];

  Future getpolicyList() async {
    policyList = await policyDatabseProvider.getList();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    policyDatabseProvider = PolicyDatabseProvider();
    policyDatabseProvider.open();
  }

  Future<void> saveModel() async {
    final result = await policyDatabseProvider.insert(policyModel);
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
