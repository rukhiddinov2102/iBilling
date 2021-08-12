import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:testapp/data/user.dart';
import 'package:testapp/details/item_maker.dart';
import 'package:testapp/models/homepage.dart';
import 'package:jiffy/jiffy.dart';

class ContractsPage extends StatefulWidget {
  const ContractsPage({Key? key}) : super(key: key);

  @override
  _ContractsPageState createState() => _ContractsPageState();
}

class _ContractsPageState extends State<ContractsPage> {
  bool _page = true;

  List<bool> selected = List.generate(10, (index) => false);

  var _currentMonth = Jiffy().month;
  var _currentYear = Jiffy().year;
  var _currentDate = Jiffy().date;

  var jiffy;

  var _fromDate;
  var _toDate;

  var _selectedDate;
  @override
  void initState() {
    super.initState();
    jiffy = Jiffy([_currentYear, _currentMonth, _currentDate]);
    _fromDate = Jiffy([jiffy.year - 1, 1, 1]);
    _toDate = Jiffy([jiffy.year + 1, 1, 1]);
    _selectedDate = jiffy.date;
  }

  void callback() {
    setState(() {
      _page = !_page;
    });
  }

  @override
  Widget build(BuildContext context) {
    jiffy = Jiffy([_currentYear, _currentMonth, _currentDate]);
    return _page
        ? Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              actions: [
                Container(
                  width: 120,
                  margin: EdgeInsets.only(right: 16),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _page = !_page;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              child: ImageIcon(
                                AssetImage("assets/icons2/Filter.png"),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Container(
                            width: 1.0,
                            height: 5,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                              splashRadius: 0.1,
                              onPressed: () {},
                              icon: ImageIcon(
                                  AssetImage("assets/icons/Search.png"))),
                        ),
                      ]),
                )
              ],
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
              title: Text("Contracts".tr(), style: TextStyle(fontSize: 18)),
            ),
            body: Column(
              children: [
                Container(
                  color: Color.fromRGBO(30, 30, 32, 1),
                  width: 375,
                  height: 148,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                              child: Text(
                            "${jiffy.MMMM}, ${jiffy.year}",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                          GestureDetector(
                            onTap: () {
                              if (jiffy.format("MM.yyyy") !=
                                  _fromDate.format("MM.yyyy")) {
                                setState(() {
                                  _currentMonth--;
                                  _selectedDate = 1;
                                });
                              }
                            },
                            child: Icon(
                              CupertinoIcons.back,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (jiffy.format("MM.yyyy") !=
                                      _toDate.format("MM.yyyy")) {
                                    _currentMonth++;
                                    _selectedDate = 1;
                                  }
                                });
                              },
                              child: Container(
                                  height: 50.0,
                                  width: 50.0,
                                  child: Icon(
                                    CupertinoIcons.forward,
                                    color: Colors.white,
                                  ))),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Container(
                        height: 70,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: jiffy.daysInMonth,
                          itemBuilder: (context, index) {
                            return dateWidget(index);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 28),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(0, 167, 149, 1)),
                        child: Text("Contracts".tr()),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: TextButton(
                          child: Text(
                            "Invoice".tr(),
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {}),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    height: 420,
                    width: 343,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: Homepage.userData!.usersCount,
                      itemBuilder: (contxt, index) {
                        var day =
                            Jiffy([jiffy.year, jiffy.month, _selectedDate]);
                        UserElement user = Homepage.userData!.users![index];

                        if (Homepage.userData!.users![index].data ==
                            day.format("dd.MM.yyyy")) {
                          return ContractItem(
                            user: user,
                          );
                        }

                        return SizedBox();
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        : FilterWidget(callback: callback);
  }

  Widget dateWidget(int index) {
    Color today = Colors.transparent;
    if (_selectedDate == index + 1) {
      today = Color.fromRGBO(0, 167, 149, 1);
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDate = index + 1;
        });
      },
      child: Container(
        decoration:
            BoxDecoration(color: today, borderRadius: BorderRadius.circular(6)),
        width: 50,
        height: 50,
        margin: EdgeInsets.only(right: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: Text(
                "${Jiffy([jiffy.year, jiffy.month, index + 1]).E}",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Color.fromRGBO(209, 209, 209, 1)),
              ),
            ),
            Text("${index + 1}",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Color.fromRGBO(209, 209, 209, 1))),
            Container(
              margin: EdgeInsets.only(top: 4, bottom: 5),
              width: 15,
              height: 1,
              color: Color.fromRGBO(209, 209, 209, 1),
            )
          ],
        ),
      ),
    );
  }
}

class FilterWidget extends StatefulWidget {
  const FilterWidget({
    Key? key,
    this.callback,
  }) : super(key: key);

  final Function? callback;

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  Color active = Colors.white;
  Color deactive = Color.fromRGBO(153, 153, 153, 1);

  bool p_value = false;
  bool in_value = false;
  bool rp_value = false;
  bool ri_value = false;

  List _checkList = [];

  var _fromDate;
  var _toDate;

  int _date = 1;
  var _dateTime;

  @override
  void initState() {
    super.initState();

    _fromDate = Jiffy([2018, 1, _date]);
    _toDate = Jiffy([2022, 1, 1]);

    _dateTime = DateTime(_fromDate.year, _fromDate.month, _fromDate.day);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          leading: InkWell(
              onTap: () {
                widget.callback!();
              },
              child: Icon(Icons.arrow_back)),
          title: Text("Filters".tr()),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, top: 20, right: 41),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Status".tr(),
                    style: TextStyle(color: Color.fromRGBO(241, 241, 241, 1)),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Container(
                      width: 143,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                p_value = !p_value;

                                if (p_value) {
                                  _checkList.add("paid");
                                } else {
                                  _checkList.remove("paid");
                                }
                              });
                              print(_checkList);
                            },
                            child: Container(
                                margin: EdgeInsets.only(top: 18),
                                child: p_value
                                    ? ImageIcon(
                                        AssetImage(
                                            "assets/icons2/Tick Square.png"),
                                        color: Colors.white,
                                      )
                                    : ImageIcon(
                                        AssetImage(
                                            "assets/icons/Tick Square.png"),
                                        color: Color.fromRGBO(153, 153, 153, 1),
                                      )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16, left: 8),
                            child: Text(
                              "Paid".tr(),
                              style: TextStyle(
                                  color: p_value ? Colors.white : deactive),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 160,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                ri_value = !ri_value;

                                if (ri_value) {
                                  _checkList.add("rejected iq");
                                } else {
                                  _checkList.remove("rejected iq");
                                }
                              });
                              print(_checkList);
                            },
                            child: Container(
                                margin: EdgeInsets.only(top: 18),
                                child: ri_value
                                    ? ImageIcon(
                                        AssetImage(
                                            "assets/icons2/Tick Square.png"),
                                        color: Colors.white,
                                      )
                                    : ImageIcon(
                                        AssetImage(
                                            "assets/icons/Tick Square.png"),
                                        color: Color.fromRGBO(153, 153, 153, 1),
                                      )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16, left: 8),
                            child: Text(
                              "Rejected IQ".tr(),
                              style: TextStyle( 
                                  color: ri_value ? Colors.white : deactive),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 143,
                        child: Row(
                          children: [
                            InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  in_value = !in_value;

                                  if (in_value) {
                                    _checkList.add("in process");
                                  } else {
                                    _checkList.remove("in process");
                                  }
                                });
                                print(_checkList);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 18),
                                  child: in_value
                                      ? ImageIcon(
                                          AssetImage(
                                              "assets/icons2/Tick Square.png"),
                                          color: Colors.white,
                                        )
                                      : ImageIcon(
                                          AssetImage(
                                              "assets/icons/Tick Square.png"),
                                          color:
                                              Color.fromRGBO(153, 153, 153, 1),
                                        )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16, left: 8),
                              child: Text("In process".tr(),
                                  style: TextStyle(
                                      color: in_value ? Colors.white : deactive)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 160,
                        child: Row(
                          children: [
                            InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  rp_value = !rp_value;

                                  if (rp_value) {
                                    _checkList.add("rejected payme");
                                  } else {
                                    _checkList.remove("rejected payme");
                                  }
                                });
                                print(_checkList);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 18),
                                  child: rp_value
                                      ? ImageIcon(
                                          AssetImage(
                                              "assets/icons2/Tick Square.png"),
                                          color: Colors.white,
                                        )
                                      : ImageIcon(
                                          AssetImage(
                                              "assets/icons/Tick Square.png"),
                                          color:
                                              Color.fromRGBO(153, 153, 153, 1),
                                        )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16, left: 8),
                              child: Text("Rejected Payme".tr(),
                                  style: TextStyle(
                                      color: rp_value ? Colors.white : deactive)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      "Date".tr(),
                      style: TextStyle(color: Color.fromRGBO(241, 241, 241, 1)),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            highlightColor: Colors.transparent,
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: _dateTime,
                                lastDate: DateTime(2099),
                              ).then((DateTime? value) {
                                if (value != null) {
                                  setState(() {
                                    _toDate = Jiffy(
                                        [value.year, value.month, value.day]);
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "From".tr(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  ImageIcon(
                                    AssetImage("assets/icons2/Calendar.png"),
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 15, left: 12, right: 12),
                            color: Colors.white,
                            width: 12,
                            height: 3,
                          ),
                          Container(
                            width: 116,
                            height: 37,
                            margin: EdgeInsets.only(top: 16),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(42, 42, 45, 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: _dateTime,
                                      lastDate: DateTime(2099),
                                    ).then((DateTime? value) {
                                      if (value != null) {
                                        setState(() {
                                          _toDate = Jiffy([
                                            value.year,
                                            value.month,
                                            value.day
                                          ]);
                                        });
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 116,
                                    height: 37,
                                    margin: EdgeInsets.only(),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(42, 42, 45, 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("To".tr(),
                                            style:
                                                TextStyle(color: Colors.white)),
                                        ImageIcon(
                                          AssetImage(
                                              "assets/icons2/Calendar.png"),
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                itemCount: Homepage.userData!.usersCount,
                itemBuilder: (context, index) {
                  UserElement user = Homepage.userData!.users![index];

                  while (true) {
                    _fromDate = Jiffy([2018, 1, _date]);
                    if (_fromDate.format("dd.MM.yyyy") ==
                        _toDate.format("dd.MM.yyyy")) {
                      break;
                    } else {
                      if (_fromDate.format("dd.MM.yyyy") == user.data) {
                        for (String item in _checkList) {
                          if (item.toLowerCase() ==
                              user.status!.toLowerCase()) {
                            print("true");
                            return ContractItem(
                              user: user,
                            );
                          }
                        }
                      }
                    }

                    _date++;
                  }

                  _date = 0;

                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// CheckboxListTile(
//   value: _paid,
//   onChanged: (value) {
//     setState(() {
//       _paid = !_paid;

//     });

//     if (_paid) {
//       _checkList.add("paid");
//     } else {
//       _checkList.remove("paid");
//     }

//     print(_checkList);
//   },
// ),
// CheckboxListTile(
//   value: _payme,
//   onChanged: (value) {
//     setState(() {
//       _payme = !_payme;

//       if (_payme) {
//         _checkList.add("rejected payme");
//       } else {
//         _checkList.remove("rejected payme");
//       }
//     });
//     print(_checkList);
//   },
// ),

// ElevatedButton(
//                 onPressed: () {
//                   widget.callback!(
//                       Jiffy(_fromDate), Jiffy(_toDate), _checkList);
//                 },
//                 child: Text("Apply"),
//               ),
