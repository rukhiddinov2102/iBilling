import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:jiffy/jiffy.dart';
import 'package:testapp/data/user.dart';
import 'package:testapp/models/homepage.dart';

class NewContractPage extends StatefulWidget {
  const NewContractPage({Key? key, this.callback}) : super(key: key);

  final Function? callback;

  @override
  _NewContractPageState createState() => _NewContractPageState();
}

class _NewContractPageState extends State<NewContractPage> {
  String _name = "";
  String _address = "";
  String _inn = "";

  final _formkey = GlobalKey<FormState>();

  List _testList = [
    {'no': 1, 'keyword': 'Physical person'.tr()},
    {'no': 2, 'keyword': 'Legal entity'.tr()},
  ];
  List<DropdownMenuItem<Object?>> _dropdownTestItems = [];
  var _selectedTest;

  @override
  void initState() {
    _dropdownTestItems = buildDropdownTestItems(_testList);
    _dropdownTestItems2 = buildDropdownTestItems2(_testList2);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<DropdownMenuItem<Object?>> buildDropdownTestItems(List _testList) {
    List<DropdownMenuItem<Object?>> items = [];
    for (var i in _testList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['keyword']),
        ),
      );
    }
    return items;
  }

  onChangeDropdownTests(selectedTest) {
    print(selectedTest);
    setState(() {
      _selectedTest = selectedTest;
    });
  }

  List _testList2 = [
    {'no': 1, 'keyword': 'Paid'.tr()},
    {'no': 2, 'keyword': 'In process'.tr()},
    {'no': 3, 'keyword': 'Rejected by Payme'.tr()},
    {'no': 4, 'keyword': 'Rejected by IQ'.tr()},
  ];
  List<DropdownMenuItem<Object?>> _dropdownTestItems2 = [];
  var _selectedTest2;

  List<DropdownMenuItem<Object?>> buildDropdownTestItems2(List _testList) {
    List<DropdownMenuItem<Object?>> items2 = [];
    for (var i in _testList2) {
      items2.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['keyword']),
        ),
      );
    }
    return items2;
  }

  onChangeDropdownTests2(selectedTest2) {
    print(selectedTest2);
    setState(() {
      _selectedTest2 = selectedTest2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Container(
          width: 343,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Litso part
                Text(
                  "Person".tr(),
                  style: TextStyle(color: Color.fromRGBO(241, 241, 241, 1)),
                ),

                GestureDetector(
                  onTap: (){
                    FocusScope.of(context).unfocus();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: DropdownBelow(
                      itemWidth: 343,
                      itemTextstyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      boxTextstyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white54),
                      boxPadding: EdgeInsets.fromLTRB(13, 12, 13, 12),
                      boxWidth: 343,
                      boxHeight: 44,
                      boxDecoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                              width: 1, color: Color.fromRGBO(241, 241, 241, 1)),
                          borderRadius: BorderRadius.circular(4)),
                      icon: Icon(
                        Icons.arrow_drop_down_circle,
                        color: Colors.white54,
                      ),
                      hint: Text(''),
                      value: _selectedTest,
                      items: _dropdownTestItems,
                      onChanged: onChangeDropdownTests,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    "Fisher's full name".tr(),
                    style: TextStyle(color: Color.fromRGBO(241, 241, 241, 1)),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: SizedBox(
                    height: 44,
                    child: TextFormField(
                      style: new TextStyle(color: Colors.white, fontSize: 14),
                      maxLines: 1,
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(241, 241, 241, 1),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(241, 241, 241, 1),
                            width: 1,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      onSaved: (e) {
                        _name = e!;
                      },
                      onChanged: (value) => print(value),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    "Address of the organization".tr(),
                    style: TextStyle(color: Color.fromRGBO(241, 241, 241, 1)),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: SizedBox(
                    height: 66,
                    child: TextFormField(
                      style: new TextStyle(color: Colors.white, fontSize: 14),
                      maxLines: 2,
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(241, 241, 241, 1),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(241, 241, 241, 1),
                            width: 1,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      onSaved: (value) => _address = value!,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    "INN".tr(),
                    style: TextStyle(color: Color.fromRGBO(241, 241, 241, 1)),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: SizedBox(
                    height: 44,
                    child: TextFormField(
                      style: new TextStyle(color: Colors.white, fontSize: 14),
                      maxLines: 1,
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(241, 241, 241, 1),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(241, 241, 241, 1),
                            width: 1,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      onSaved: (value) => _inn = value!,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    "Status of the contract".tr(),
                    style: TextStyle(color: Color.fromRGBO(241, 241, 241, 1)),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: DropdownBelow(
                    itemWidth: 343,
                    itemTextstyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    boxTextstyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white54),
                    boxPadding: EdgeInsets.fromLTRB(13, 12, 13, 12),
                    boxWidth: 343,
                    boxHeight: 44,
                    boxDecoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                            width: 1, color: Color.fromRGBO(241, 241, 241, 1)),
                        borderRadius: BorderRadius.circular(4)),
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.white54,
                    ),
                    hint: Text(''),
                    value: _selectedTest2,
                    items: _dropdownTestItems2,
                    onChanged: onChangeDropdownTests2,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Container(
                    width: 343,
                    height: 44,
                    child: ElevatedButton(
                      child: Text(
                        "Save contract".tr(),
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: _save,
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(0, 143, 127, 1)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _save() {
    _formkey.currentState!.save();

    final _newUser = UserElement(
      adress: _address,
      data: Jiffy().format("dd.MM.yyyy"),
      id: Homepage.userData!.usersCount,
      inn: _inn,
      name: _name,
      amount: "0",
      status: _selectedTest2['keyword'],
      lastInvoice: 95,
      numberOfInvoice: 108,
      count: "108",
    );

    Homepage.userData!.usersCount++;

    Homepage.userData!.users!.add(_newUser);

    widget.callback!(0);
  }
}
