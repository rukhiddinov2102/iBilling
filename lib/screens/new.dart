import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:testapp/screens/new_contract_page.dart';
import 'package:testapp/screens/new_invoice.dart';

class AddContract extends StatefulWidget {
  const AddContract({Key? key, required this.currentPage, this.callback}) : super(key: key);
  
  final Function? callback;
  final bool currentPage;

  @override
  _AddContractState createState() => _AddContractState();
}

class _AddContractState extends State<AddContract> {
  

  var selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(20, 20, 22, 1),
        leading: Container(
          margin: EdgeInsets.only(left: 20, top: 14, bottom: 13),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [
                Color.fromRGBO(0, 255, 194, 1),
                Color.fromRGBO(5, 0, 255, 1),
                Color.fromRGBO(255, 199, 0, 1),
                Color.fromRGBO(173, 0, 255, 1),
                Color.fromRGBO(0, 255, 148, 1)
              ])),
        ),
        title: Text(widget.currentPage ? "New Invoice".tr() : "New Contract".tr(), style: TextStyle(fontSize: 18)),
      ),
      body: widget.currentPage ? NewInvoicePage() : NewContractPage(callback: widget.callback),
    );
  }
}





