class User {
  int? id;
  String? username;
  String? email;
  String? phoneNumber;

  User({this.id, this.username, this.phoneNumber, this.email});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }
    map['name'] = username;
    map['phoneNumber'] = phoneNumber;
    map['email'] = email;

    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.username = map['username'];
    this.email = map['email'];
    this.phoneNumber = map['phoneNumber'];
  }
}
