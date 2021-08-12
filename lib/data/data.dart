import 'package:easy_localization/easy_localization.dart';
class Data {
  String? name;
  String? amount;
  String? invoice;
  int? numinvoice;
  String? date;

  Data({this.name, this.amount, this.invoice, this.numinvoice, this.date});

  List ismlar = [
    'Umid Rukhiddinov',
    "Murod Anorboyev",
    "Abdulla Oripov",
    "Jack Ma",
    "Bill Gates",
    "Stive Jobs",
    "Jeff Bezos",
    "Aziz Rakhimov",
    "Sultan Ahmad",
    "Alibaba"
  ];

  List amounts = [
    "1,200,000",
    "2,400,000",
    "1,156,000",
    "1,223,000",
    "1,100,000",
    "1,080,000",
    "2,321,000",
    "2,512,000",
    "2,342,000",
    "3,123,200"
  ];

  List lasts = [
    "№ 123",
    "№ 321",
    "№ 256",
    "№ 521",
    "№ 654",
    "№ 421",
    "№ 746",
    "№ 365",
    "№ 892",
    "№ 759",
  ];

  List numbers = [1, 2, 4, 6, 7, 12, 34, 5, 11, 14];

  List dates = [
    "11.02.2021",
    "12.03.2021",
    "24.04.2021",
    "31.07.2021",
    "23.01.2021",
    "25.06.2021",
    "16.05.2021",
    "24.07.2021",
    "12.06,2021",
    "14.05.2021"
  ];
}
