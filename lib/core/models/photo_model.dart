
class PhotoResponse {
  final List<Photo> photos;

  PhotoResponse({
    this.photos = const []
  });

  factory PhotoResponse.fromJson(List<dynamic>? json) {
    List<Photo> photos = [];
    if (json != null) {
      photos = json.map((photo) => Photo.fromJson(photo)).toList();
    }
    return PhotoResponse(photos: photos);
  }

  Map<String, dynamic> toJson() {
    return {
      'photos': photos.map((photo) => photo.toJson()).toList(),
    };
  }

}

class Photo {
  final int? id;
  final int? albumId;
  final String? title;
  final String? url;

  Photo({
    this.id = 0,
    this.albumId,
    this.title,
    this.url,
  });

  factory Photo.fromJson(Map<String, dynamic>? json) {
    return Photo(
      id: json?['id'] ?? 0,
      albumId: json?['albumId'],
      title: json?['title'],
      url: json?['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'albumId': albumId,
      'title': title,
      'url': url,
    };
  }

}
