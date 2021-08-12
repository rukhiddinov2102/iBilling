import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:dropdown_below/dropdown_below.dart';

class NewInvoicePage extends StatefulWidget {
  const NewInvoicePage({Key? key}) : super(key: key);

  @override
  _NewInvoicePageState createState() => _NewInvoicePageState();
}

class _NewInvoicePageState extends State<NewInvoicePage> {
  List _testList = [
    {'no': 1, 'keyword': 'Physical person'.tr()},
    {'no': 2, 'keyword': 'Legal entity'.tr()},
  ];
  List<DropdownMenuItem<Object?>> _dropdownTestItems = [];
  var _selectedTest;

  @override
  void initState() {
    _dropdownTestItems = buildDropdownTestItems(_testList);

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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Xizmat nomi".tr(),
            style: TextStyle(color: Color.fromRGBO(241, 241, 241, 1)),
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
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SizedBox(
              child: Text(
                "Invoice summasi".tr(),
                style: TextStyle(color: Color.fromRGBO(241, 241, 241, 1)),
              ),
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
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              "Status of the invoice".tr(),
              style: TextStyle(color: Color.fromRGBO(241, 241, 241, 1)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: DropdownBelow(
              elevation: 0,
              itemWidth: MediaQuery.of(context).size.width - 32,
              itemTextstyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              boxTextstyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white54),
              boxPadding: EdgeInsets.fromLTRB(13, 12, 13, 12),
              boxWidth: MediaQuery.of(context).size.width,
              boxHeight: 44,
              boxDecoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                    width: 1, color: Color.fromRGBO(241, 241, 241, 1)),
                borderRadius: BorderRadius.circular(4),
              ),
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
        ],
      ),
    );
  }
}
