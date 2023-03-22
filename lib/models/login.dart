class User {
  final String user_id;
  //final String user_name;
  final String user_pass;
  //final int isAdmin;

  User(this.user_id, this.user_pass);
  factory User.fromMap(Map<String, dynamic> json) {
    return User(json['user_id'], json['user_pass']);
  }
  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['user_id'], json['user_pass']);
  }

  Map<String, dynamic> toJson() => {
        'user_id': user_id,

        'user_pass': user_pass,
        // 'isAdmin': isAdmin
      };
}
