class Profile {
  final int id;
  final String username;

  Profile({
    required this.id, 
    required this.username});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
    };
  }

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      username: json['username'],
    );
  }
}