import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jiffy/jiffy.dart';
import 'package:testapp/data/user.dart';
import 'package:testapp/details/item_maker.dart';
import 'package:testapp/models/homepage.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  var _fromDate = Jiffy();
  var _toDate = Jiffy();

  int year = 2020;
  int month = 1;
  int day = 1;

  var _dateTime;


  @override
  initState() {
    super.initState();
    _dateTime = DateTime(_fromDate.year, _fromDate.month, _fromDate.day);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // actions: [
        //   Container(
        //     width: 100,
        //     margin: EdgeInsets.only(right: 30),
        //     child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Expanded(
        //               child: ImageIcon(AssetImage("assets/icons2/Filter.png"))),
        //           Text("|"),
        //           InkWell(
        //             onTap: () {},
        //             child: Expanded(
        //               child: IconButton(
        //                   onPressed: () {},
        //                   icon:
        //                       ImageIcon(AssetImage("assets/icons/Search.png"))),
        //             ),
        //           ),
        //         ]),
        //   )
        // ],
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
        title: Text("History".tr(), style: TextStyle(fontSize: 18)),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 8,right:8, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Date",
              style: TextStyle(color: Color.fromRGBO(241, 241, 241, 1)),
            ),
            Row(
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: _dateTime,
                      firstDate: DateTime(2018),
                      lastDate: DateTime(2025),
                    ).then((DateTime? value) {
                      if (value != null) {
                        year = value.year;
                        month = value.month;
                        day = value.day;

                        setState(() {
                          _fromDate = Jiffy([year, month, day]);

                          _dateTime = DateTime(
                              _fromDate.year, _fromDate.month, _fromDate.day);
                        });
                      }
                    });
                  },
                  child: Container(
                    width: 116,
                    height: 37,
                    margin: EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(42, 42, 45, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                        _fromDate.format("01.MM.yyyy"),
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        ImageIcon(AssetImage("assets/icons2/Calendar.png"),color: Color.fromRGBO(218, 218, 218, 1),)
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 12, right: 12),
                  color: Colors.white,
                  width: 12,
                  height: 3,
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: _dateTime,
                      firstDate: _dateTime,
                      lastDate: DateTime(2022),
                    ).then((DateTime? value) {
                      if (value != null) {
                        setState(() {
                          _toDate = Jiffy([value.year, value.month, value.day]);
                        });
                      }
                    });
                  },
                  child: Container(
                    width: 116,
                    height: 37,
                    margin: EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(42, 42, 45, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          _toDate.format("dd.MM.yyyy"),
                          style: TextStyle(color: Colors.white),
                        ),
                        ImageIcon(AssetImage("assets/icons2/Calendar.png"),color: Color.fromRGBO(218, 218, 218, 1),)
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15,),
            
            Padding(
              padding: const EdgeInsets.only(left: 12,right: 12),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height:200,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only( top: 15),
                  itemCount: Homepage.userData!.usersCount,
                  itemBuilder: (context, index) {
                    final _temp = day;
                    UserElement user = Homepage.userData!.users![index];

                    while (true) {
                      _fromDate = Jiffy([year, month, day]);

                      if (_fromDate.format("dd.MM.yyyy") ==
                          _toDate.format("dd.MM.yyyy")) {
                        break;
                      } else {
                        if (_fromDate.format("dd.MM.yyyy") == user.data) {
                          return ContractItem(
                            user: user,
                          );
                        }
                      }

                      day++;
                    }

                    day = _temp;

                    return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
