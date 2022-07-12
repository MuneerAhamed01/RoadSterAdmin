
import 'dart:convert';

RevenueGet revenueGetFromJson(String str) => RevenueGet.fromJson(json.decode(str));

String revenueGetToJson(RevenueGet data) => json.encode(data.toJson());

class RevenueGet {
    RevenueGet({
       required this.revenu,
    });

    List<Revenu> revenu;

    factory RevenueGet.fromJson(Map<String, dynamic> json) => RevenueGet(
        revenu: List<Revenu>.from(json["revenu"].map((x) => Revenu.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "revenu": List<dynamic>.from(revenu.map((x) => x.toJson())),
    };
}

class Revenu {
    Revenu({
       required this.sum,
    });

    int sum;

    factory Revenu.fromJson(Map<String, dynamic> json) => Revenu(
        sum: json["sum"],
    );

    Map<String, dynamic> toJson() => {
        "sum": sum,
    };
}