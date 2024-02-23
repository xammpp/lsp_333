// ignore_for_file: file_names, unnecessary_this, prefer_collection_literals

class Attend {
  int? id;
  String? name;
  String? mobileNo;
  String? email;
  String? location;

  Attend({this.id, this.name, this.mobileNo, this.email, this.location});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['mobileNo'] = mobileNo;
    map['email'] = email;
    map['location'] = location;

    return map;
  }

  Attend.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.mobileNo = map['mobileNo'];
    this.email = map['email'];
    this.location = map['location'];
  }
}
