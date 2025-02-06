class UserModel {
  final String? id;
  final String name;
  final String location;
  final String? profileImage;

  UserModel({
    this.id,
    required this.name,
    required this.location,
    this.profileImage,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'location': location,
    'profileImage': profileImage,
  };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    name: json['name'],
    location: json['location'],
    profileImage: json['profileImage'],
  );
}
