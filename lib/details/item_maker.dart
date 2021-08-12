import 'package:flutter/material.dart';
import 'package:testapp/data/data.dart';
import 'package:testapp/data/user.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:testapp/models/homepage.dart';

class ContractItem extends StatefulWidget {
  ContractItem({Key? key, this.user}) : super(key: key);

  final UserElement? user;

  @override
  _ContractItemState createState() => _ContractItemState();
}

class _ContractItemState extends State<ContractItem> {
  List<bool> selectedContainer =
      List.generate(Homepage.userData!.usersCount, (index) => false);

  Color paidColor = Color.fromRGBO(73, 183, 165, 1);
  Color elbPrimary = Color.fromRGBO(73, 183, 165, 0.15);

  var a = Data();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    if (widget.user!.status == "Rejected Payme" ||
        widget.user!.status == "Rejected IQ") {
      paidColor = Color.fromRGBO(255, 66, 109, 1);
      elbPrimary = Color.fromRGBO(255, 66, 109, 0.15);
    } else if (widget.user!.status == "In process") {
      paidColor = Color.fromRGBO(253, 171, 42, 1);
      elbPrimary = Color.fromRGBO(253, 171, 42, 0.15);
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedContainer[index] = !selectedContainer[index];
        });
      },
      child: AnimatedContainer(
        height: selectedContainer[index] ? 380 : 161,
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(42, 42, 45, 1),
              borderRadius: BorderRadius.circular(6)),
          margin: EdgeInsets.only(bottom: 10),
          width: selectedContainer[index] ? 343 : 343,
          height: selectedContainer[index] ? 370 : 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12.62, right: 12, top: 12),
                child: Row(
                  children: [
                    //row ning asosiy containeri
                    Container(
                      margin: EdgeInsets.only(right: 12,left: 12),
                      width: MediaQuery.of(context).size.width,

                      //icon va numberni ushlab turadigan container

                      child: Container(
                        width: 71.0,
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                //icon uchun qilingan container
                                Container(
                                  margin: EdgeInsets.only(top: 1.5, left: 2.63),
                                  width: 15.75,
                                  height: 20,
                                  child: Image.asset(
                                    "assets/icons2/Paper.png",
                                    color: Color.fromRGBO(0, 167, 149, 1),
                                  ),
                                ),

                                SizedBox(width: 8.62),

                                // number uchun qilingan contaienr
                                Container(
                                  child: Text(
                                    "№ " + widget.user!.count.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: OutlinedButton(
                                onPressed: () {},
                                child: Text(
                                  widget.user!.status.toString().tr(),
                                  style:
                                      TextStyle(fontSize: 14, color: paidColor),
                                ),
                                style: OutlinedButton.styleFrom(
                                    primary: elbPrimary),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 14.5,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 11.97),
                    child: Text(
                      "Name:".tr(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 7.98,
                  ),
                  Text(
                    widget.user!.name.toString().tr(),
                    style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1)),
                  ),
                ],
              ),
              SizedBox(
                height: 4.0,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 11.97),
                    child: Text(
                      "Amount:".tr(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 7.98,
                  ),
                  Text(
                    widget.user!.amount.toString().tr(),
                    style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1)),
                  ),
                ],
              ),
              SizedBox(
                height: 4.0,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 11.97),
                    child: Text(
                      "Last invoice:".tr(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 7.98,
                  ),
                  Text(
                    a.lasts[index],
                    style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1)),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  selectedContainer[index]
                      ? Padding(
                          padding: EdgeInsets.only(left: 11.97, top: 4),
                          child: Text("Address:".tr(),
                              style: TextStyle(color: Colors.white)),
                        )
                      : Text(""),
                  selectedContainer[index]
                      ? Container(
                          height: 50.0,
                          width: 270,
                          padding:
                              EdgeInsets.only(top: 4, left: 7.98, right: 60.0),
                          child: Text(widget.user!.adress.toString(),
                              softWrap: true,
                              style: TextStyle(
                                  color: Color.fromRGBO(153, 153, 153, 1))),
                        )
                      : Text(""),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: selectedContainer[index]
                        ? EdgeInsets.only(left: 11.97, top: 30)
                        : EdgeInsets.only(left: 11.97),
                    child: Text(
                      "Number of invoice:".tr(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 7.98,
                  ),
                  Expanded(
                    child: Padding(
                      padding: selectedContainer[index]
                          ? EdgeInsets.only(top: 30)
                          : EdgeInsets.all(0),
                      child: Text(
                        a.numbers[index].toString(),
                        style:
                            TextStyle(color: Color.fromRGBO(153, 153, 153, 1)),
                      ),
                    ),
                  ),

                  // SizedBox(
                  //   width: 102.64,
                  // ),
                  Padding(
                    padding: selectedContainer[index]
                        ? EdgeInsets.only(top: 30)
                        : EdgeInsets.all(0),
                    child: Text(
                      widget.user!.data.toString().tr(),
                      style: TextStyle(
                          color: Color.fromRGBO(153, 153, 153, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                color: Colors.black,
                height: selectedContainer[index] ? 161.5 : 0,
                width: 343,
                padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          child: Text("Delete Contract"),
                          style: OutlinedButton.styleFrom(
                              fixedSize: Size(
                                164,
                                40,
                              ),
                              primary: Color.fromRGBO(255, 66, 109, 1),
                              backgroundColor:
                                  Color.fromRGBO(255, 66, 109, 0.15)),
                          onPressed: () {
                            setState(() {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        backgroundColor: Colors.transparent,
                                        contentPadding: EdgeInsets.all(0),
                                        content: Container(
                                          decoration: BoxDecoration(
                                              color:
                                                  Color.fromRGBO(42, 42, 45, 1),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          width: 342,
                                          height: 276,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 16),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Leave a comment,why are you\n delete this contract?",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(15.0),
                                                  child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.name,
                                                    cursorColor: Colors.white,
                                                    maxLines: 3,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none),
                                                      filled: true,
                                                      fillColor: Color.fromRGBO(
                                                          92, 92, 92, 1),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 28),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      OutlinedButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text("Cancel".tr()),
                                                        style: OutlinedButton
                                                            .styleFrom(
                                                          fixedSize:
                                                              Size(140, 40),
                                                          primary:
                                                              Color.fromRGBO(
                                                                  255,
                                                                  66,
                                                                  109,
                                                                  1),
                                                          backgroundColor:
                                                              Color.fromRGBO(
                                                                  255,
                                                                  66,
                                                                  109,
                                                                  0.15),
                                                        ),
                                                      ),
                                                      OutlinedButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text("Done".tr()),
                                                        style: OutlinedButton
                                                            .styleFrom(
                                                          fixedSize:
                                                              Size(140, 40),
                                                          primary: Colors.white,
                                                          backgroundColor:
                                                              Color.fromRGBO(
                                                                  255,
                                                                  66,
                                                                  109,
                                                                  1),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ));
                            });
                          },
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: Text("Create Contract".tr()),
                          style: OutlinedButton.styleFrom(
                              fixedSize: Size(
                                164,
                                40,
                              ),
                              primary: Colors.white,
                              backgroundColor: Color.fromRGBO(0, 143, 127, 1)),
                        ),
                      ],
                    ),
                    Container(
                      child: Text(
                        "Other contracts with \n" +
                            widget.user!.name.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
