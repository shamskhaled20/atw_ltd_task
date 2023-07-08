class User {
  final int id;
  final String name;
  final String address;

  User({
    required int id,
    required String name,
    required String address,
  })  : this.id = id,
        this.name = name,
        this.address = address;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      address: json['address'],
    );
  }
}


class Album {
  final int id;
  final int userId;
  final String title;

  Album({
    required this.id,
    required this.userId,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
    );
  }
}


class Photo {
  final int id;
  final int albumId;
  final String imageUrl;

  Photo({
    required this.id,
    required this.albumId,
    required this.imageUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      albumId: json['albumId'],
      imageUrl: json['imageUrl'],
    );
  }
}
