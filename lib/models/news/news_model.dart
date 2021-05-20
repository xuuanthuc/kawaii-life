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
    return data;
  }
}
