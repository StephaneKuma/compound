class User {
  final String? id;
  final String fullName;
  final String? email;
  final String userRole;

  User({this.id, this.fullName = '', this.email, this.userRole = 'User'});

  User.fromMap({required Map<String, dynamic> map})
      : id = map['id'],
        fullName = map['fullName'],
        email = map['email'],
        userRole = map['userRole'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'userRole': userRole,
    };
  }
}
