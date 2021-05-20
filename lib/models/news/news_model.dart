class News {
 late int? id;
 late String? title;
 late String? description;
 late int? commentsCount;
 late int? views;
 late  bool? hasVideos;
 late  bool? isFeatured;
 late  String? slug;
 late  String? thumbnail;
 late String? publishedAt;
 late String? content;
 Genre? genre;

  News({
    this.id,
    this.title,
    this.description,
    this.commentsCount,
    this.views,
    this.hasVideos,
    this.isFeatured,
    this.slug,
    this.thumbnail,
    this.publishedAt,
    this.content,
    this.genre
  });

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    commentsCount = json['comments_count'];
    views = json['views'];
    hasVideos = json['has_videos'];
    isFeatured = json['is_featured'];
    slug = json['slug'];
    thumbnail = json['thumbnail'];
    publishedAt = json['published_at'];
    content = json['content'];
    genre = json['genre'] != null ? new Genre.fromJson(json['genre']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['comments_count'] = this.commentsCount;
    data['views'] = this.views;
    data['has_videos'] = this.hasVideos;
    data['is_featured'] = this.isFeatured;
    data['slug'] = this.slug;
    data['thumbnail'] = this.thumbnail;
    data['published_at'] = this.publishedAt;
    data['content'] = this.content;
    if (this.genre != null) {
      data['genre'] = this.genre!.toJson();
    }
    return data;
  }
}
class Genre {
  late int? id;
  late String? name;
  late String? slug;

  Genre({this.id, this.name, this.slug});

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
