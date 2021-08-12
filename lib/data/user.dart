// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        required this.usersCount,
        this.users,
    });

    int usersCount;
    List<UserElement>? users;

    factory User.fromJson(Map<String, dynamic> json) => User(
        usersCount: json["users_count"],
        users: List<UserElement>.from(json["users"].map((x) => UserElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "users_count": usersCount,
        "users": List<dynamic>.from(users!.map((x) => x.toJson())),
    };
}

class UserElement {
    UserElement({
        this.id,
        this.name,
        this.amount,
        this.lastInvoice,
        this.numberOfInvoice,
        this.data,
        this.adress,
        this.inn,
        this.count,
        this.status,
    });

    int? id;
    String? name;
    String? amount;
    int? lastInvoice;
    int? numberOfInvoice;
    String? data;
    String? adress;
    String? inn;
    String? count;
    String? status;

    factory UserElement.fromJson(Map<String, dynamic> json) => UserElement(
        id: json["id"],
        name: json["name"],
        amount: json["amount"],
        lastInvoice: json["last_invoice"],
        numberOfInvoice: json["number_of_invoice"],
        data: json["data"],
        adress: json["Adress"],
        inn: json["INN"],
        count: json["count"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "amount": amount,
        "last_invoice": lastInvoice,
        "number_of_invoice": numberOfInvoice,
        "data": data,
        "Adress": adress,
        "INN": inn,
        "count": count,
        "status": status,
    };
}
