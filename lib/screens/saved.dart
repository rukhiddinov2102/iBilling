import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  bool person = false;
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
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //       Expanded(child: ImageIcon(AssetImage("assets/icons2/Filter.png"))),

          //        Text("|"),

          //        InkWell(
          //          onTap: (){

          //          },
          //          child: Expanded(
          //           child: IconButton(
          //             onPressed: () {},
          //             icon: ImageIcon(AssetImage("assets/icons/Search.png"))
          //           ),
          //                      ),
          //        ),

          //     ]),
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
          title: Text("Saved".tr(), style: TextStyle(fontSize: 18)),
        ),
        body: Container(
            child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 250),
                width: 80,
                height: 90,
                child: IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    AssetImage("assets/icons2/Bookmark.png"),
                    size: 70,
                    color: Color.fromRGBO(241, 241, 241, 0.4),
                  ),
                ),
              ),
              Text("No saved contracts",
                  style: TextStyle(
                      color: Color.fromRGBO(241, 241, 241, 0.4), fontSize: 14))
            ],
          ),
        )));
  }
}
