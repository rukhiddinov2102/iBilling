import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jiffy/jiffy.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  StateSetter? _setstate;
  String def_image = "";
  int radiovalue = 0;
  String langname = "Choose language".tr();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: Text("Profile".tr(), style: TextStyle(fontSize: 18)),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: 20, left: 25, right: 16, bottom: 11.89),
                width: 343,
                height: 188,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Color.fromRGBO(42, 42, 45, 1),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.account_circle_rounded,
                        size: 50,
                        color: Color.fromRGBO(0, 167, 149, 1),
                      ),
                      title: Text(
                        "Umid Rukhiddinov".tr(),
                        style: TextStyle(color: Color.fromRGBO(0, 167, 149, 1)),
                      ),
                      subtitle: Text(
                        "Flutter developer".tr(),
                        style:
                            TextStyle(color: Color.fromRGBO(231, 231, 231, 1)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 20.8,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Date of birth:".tr(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(231, 231, 231, 1)),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "21.02.2000",
                            style: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1)),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12, left: 20.8),
                      child: Row(
                        children: [
                          Text(
                            "Phone number:".tr(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(231, 231, 231, 1)),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "+99897 112-21-02",
                            style: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1)),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12, left: 20.8),
                      child: Row(
                        children: [
                          Text(
                            "E-mail:".tr(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(231, 231, 231, 1)),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "umidrukhiddinov70@gmail.com",
                            style: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: InkWell(
                  child: Container(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      width: 343,
                      height: 44,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color.fromRGBO(42, 42, 45, 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            langname.toString().tr(),
                            style: TextStyle(
                                color: Color.fromRGBO(231, 231, 231, 1)),
                          ),
                          CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage(def_image),
                          )
                        ],
                      )),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) =>
                            StatefulBuilder(builder: (context, setstate) {
                              _setstate = setstate;
                              return AlertDialog(
                                backgroundColor: Color.fromRGBO(42, 42, 45, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                contentPadding: EdgeInsets.all(0),
                                content: Container(
                                  width: 333,
                                  height: 285,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 16),
                                        child: Text(
                                          "Choose a language".tr(),
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      ListTile(
                                        leading: CircleAvatar(
                                          backgroundImage:
                                              AssetImage("assets/img/uzb.png"),
                                        ),
                                        title: Text(
                                          "Uzbek (Latin)".tr(),
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  231, 231, 231, 1)),
                                        ),
                                        trailing: Radio(
                                          groupValue: radiovalue,
                                          value: 1,
                                          onChanged: (int? d) {
                                            context.setLocale(Locale('uz'));
                                            radiovalue = d!;
                                            langname = "Uzbek (Latin)";
                                            def_image = "assets/img/uzb.png";
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        leading: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/img/rus.jpg")),
                                        title: Text("Russian".tr(),
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    231, 231, 231, 1))),
                                        trailing: Radio(
                                          groupValue: radiovalue,
                                          value: 2,
                                          onChanged: (int? val) {
                                            context.setLocale(Locale('ru'));
                                            radiovalue = val!;
                                            langname = "Russian";
                                            def_image = "assets/img/rus.jpg";
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        leading: CircleAvatar(
                                          backgroundImage:
                                              AssetImage("assets/img/usa.png"),
                                        ),
                                        title: Text("English (USA)".tr(),
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    231, 231, 231, 1))),
                                        trailing: Radio(
                                          groupValue: radiovalue,
                                          value: 3,
                                          onChanged: (int? e) {
                                            context.setLocale(Locale('en'));
                                            radiovalue = e!;
                                            langname = "English (USA)";
                                            def_image = "assets/img/usa.png";
                                          },
                                        ),
                                      ),
                                      ButtonBar(
                                        alignment: MainAxisAlignment.end,
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Cancel".tr(),
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0, 143, 127, 1)),
                                            ),
                                            style: OutlinedButton.styleFrom(
                                                backgroundColor: Color.fromRGBO(
                                                    0, 143, 127, 0.15)),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          OutlinedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Done".tr(),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            style: OutlinedButton.styleFrom(
                                                backgroundColor: Color.fromRGBO(
                                                    0, 143, 127, 0.5)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }));
                  },
                ),
              )
            ],
          ),
        ));
  }
}


//  FloatingActionButton(
//             onPressed: () {
//               context.setLocale(Locale('uz'));
//             },
//             child: Text("uz"),
//           ),
//           FloatingActionButton(
//             onPressed: () {
//               context.setLocale(Locale('en'));
//             },
//             child: Text("en"),
//           ),
//           FloatingActionButton(
//             onPressed: () {
//               context.setLocale(Locale('ru'));
//             },