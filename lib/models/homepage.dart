import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/data/user.dart';
import 'package:testapp/screens/contracts.dart';
import 'package:testapp/screens/history.dart';
import 'package:testapp/screens/new.dart';
import 'package:testapp/screens/profile.dart';
import 'package:testapp/screens/saved.dart';
import 'package:easy_localization/easy_localization.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  static User? userData;
  static User? savedData;

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _currentPage = false;
  Future<User>? futureJsonData;

  List icons = [
    "assets/icons/Document.png",
    "assets/icons/Time Circle.png",
    "assets/icons/Plus.png",
    "assets/icons/Bookmark.png",
    "assets/icons/Profile.png"
  ];

  List icons2 = [
    "assets/icons2/Document.png",
    "assets/icons2/Time Circle.png",
    "assets/icons2/Plus.png",
    "assets/icons2/Bookmark.png",
    "assets/icons2/Profile.png"
  ];

  Map? dataMap;

  int currentIndex = 0;

  Future<User> _getJsonData() async {
    final String response =
        await rootBundle.loadString('assets/json/data.json');
    final data = jsonDecode(response);
    dataMap = data;

    return User.fromJson(data);
  }

  void callback(pageIndex) {
    setState(() {
      currentIndex = pageIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    futureJsonData = _getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pagelar = [
      ContractsPage(),
      HistoryPage(),
      AddContract(
        currentPage: _currentPage,
        callback: callback,
      ),
      SavedPage(),
      ProfilePage(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Color.fromRGBO(166, 166, 166, 1),
        selectedItemColor: Color.fromRGBO(242, 242, 242, 1),
        backgroundColor: Color.fromRGBO(20, 20, 22, 1),
        onTap: (activeIndex) {
          setState(() {
            if (activeIndex == 2) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                  backgroundColor: Color.fromRGBO(42, 42, 45, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  contentPadding: EdgeInsets.all(0),
                  content: Container(
                    width: 327,
                    height: 190,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "What to add".tr(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 28),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          width: 287,
                          height: 46,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              setState(() {
                                if (_currentPage) {
                                  _currentPage = !_currentPage;
                                }

                                currentIndex = activeIndex;
                              });
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ImageIcon(
                                    AssetImage("assets/icons2/Paper.png"),
                                    color: Color.fromRGBO(0, 167, 149, 1),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text("Contract".tr())
                                ]),
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(78, 78, 78, 1),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          width: 287,
                          height: 46,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              setState(() {
                                if (!_currentPage) {
                                  _currentPage = !_currentPage;
                                }

                                currentIndex = activeIndex;
                              });
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ImageIcon(
                                    AssetImage("assets/icons2/Wallet.png"),
                                    color: Color.fromRGBO(0, 167, 149, 1),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text("Invoice".tr())
                                ]),
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(78, 78, 78, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              currentIndex = activeIndex;
            }
          });
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(
                  AssetImage(currentIndex == 0 ? icons2[0] : icons[0]),
                  color: currentIndex == 0
                      ? Colors.white
                      : Color.fromRGBO(166, 166, 166, 1)),
              label: "Contracts".tr(),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(currentIndex == 1 ? icons2[1] : icons[1]),
              color: currentIndex == 1
                  ? Colors.white
                  : Color.fromRGBO(166, 166, 166, 1),
            ),
            label: "History".tr(),
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(currentIndex == 2 ? icons2[2] : icons[2]),
                color: currentIndex == 2
                    ? Colors.white
                    : Color.fromRGBO(166, 166, 166, 1),
              ),
              label: "New".tr()),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(currentIndex == 3 ? icons2[3] : icons[3]),
                color: currentIndex == 3
                    ? Colors.white
                    : Color.fromRGBO(166, 166, 166, 1),
              ),
              label: "Saved".tr()),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(currentIndex == 4 ? icons2[4] : icons[4]),
                color: currentIndex == 4
                    ? Colors.white
                    : Color.fromRGBO(166, 166, 166, 1),
              ),
              label: "Profile".tr()),
        ],
      ),
      body: FutureBuilder<User>(
        future: futureJsonData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Homepage.userData = snapshot.data!;
            return pagelar[currentIndex];
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
