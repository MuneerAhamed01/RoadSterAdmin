// To parse this JSON data, do
//
//     final getDistrict = getDistrictFromJson(jsonString);

import 'dart:convert';

GetDistrict getDistrictFromJson(String str) => GetDistrict.fromJson(json.decode(str));

String getDistrictToJson(GetDistrict data) => json.encode(data.toJson());

class GetDistrict {
    GetDistrict({
       required this.getdata,
    });

    List<Getdatum> getdata;

    factory GetDistrict.fromJson(Map<String, dynamic> json) => GetDistrict(
        getdata: List<Getdatum>.from(json["getdata"].map((x) => Getdatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "getdata": List<dynamic>.from(getdata.map((x) => x.toJson())),
    };
}

class Getdatum {
    Getdatum({
       required this.district,
       required this.createdAt,
       required this.updatedAt,
       required this.v,
       required this.id,
    });

    String id;
    String district;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory Getdatum.fromJson(Map<String, dynamic> json) => Getdatum(
        id: json["_id"],
        district: json["district"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "district": district,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
