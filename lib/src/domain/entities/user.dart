class User {
  final int id;
  final String username;
  final String password;
  final int idProfile;
  final String? token;

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.idProfile,
    this.token,
  });

  Map<String, dynamic> toJson() => {
    'token': token,
    'id': id,
    'username': username,
    'password': password,
    'idProfile': idProfile,
  };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      idProfile: json['idProfile'],
      token: json['token'],
    );
  }
}