class News {
  late int id;
  late int type;
  late String title;
  late String? description;
  late int? commentsCount;
  late int? views;
  late bool? hasVideos;
  late  bool? isFeatured;
  late String? slug;
  late String? thumbnail;
  late String? publishedAt;
  late  String? content;
  late  Genre? genre;
  late String? thumbnailSmall;

  News(
      {required this.id,
        required this.type,
        required this.title,
          this.description,
        this.commentsCount,
        this.views,
        this.hasVideos,
        this.isFeatured,
        this.slug,
        this.thumbnail,
        this.publishedAt,
        this.content,
        this.genre,
        this.thumbnailSmall});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    description = json['description'];
    commentsCount = json['commentsCount'];
    views = json['views'];
    hasVideos = json['hasVideos'];
    isFeatured = json['isFeatured'];
    slug = json['slug'];
    thumbnail = json['thumbnail'];
    publishedAt = json['publishedAt'];
    content = json['content'];
    genre = (json['genre'] != null ? new Genre.fromJson(json['genre']) : null)!;
    thumbnailSmall = json['thumbnailSmall'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['title'] = this.title;
    data['description'] = this.description;
    data['commentsCount'] = this.commentsCount;
    data['views'] = this.views;
    data['hasVideos'] = this.hasVideos;
    data['isFeatured'] = this.isFeatured;
    data['slug'] = this.slug;
    data['thumbnail'] = this.thumbnail;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    if (this.genre != null) {
      data['genre'] = this.genre!.toJson();
    }
    data['thumbnailSmall'] = this.thumbnailSmall;
    return data;
  }
}

class Genre {
  late int id;
  late String name;
  late String slug;

  Genre({required this.id, required this.name, required this.slug});

  Genre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}