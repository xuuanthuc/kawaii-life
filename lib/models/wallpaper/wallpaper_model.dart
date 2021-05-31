class Wallpaper {
  late String id;
  late  int type;
  late  int? downloadCount;
  late  String? title;
  late String? shareUrl;
  late String thumbUrl; //hinh anh hien thi list ben ngoai
  late  String? downloadReference;
  late  int? size;
  late String previewUrl; //hinh anh chat luong goc de download ve

  Wallpaper(
      {required this.id,
        required this.type,
        this.downloadCount,
        this.title,
        this.shareUrl,
        required this.thumbUrl,
        this.downloadReference,
        this.size,
        required this.previewUrl,
      });

  Wallpaper.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    downloadCount = json['downloadCount'];
    title = json['title'];
    shareUrl = json['shareUrl'];
    thumbUrl = json['thumbUrl'];
    downloadReference = json['downloadReference'];
    size = json['size'];
    previewUrl = json['previewUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['downloadCount'] = this.downloadCount;
    data['title'] = this.title;
    data['shareUrl'] = this.shareUrl;
    data['thumbUrl'] = this.thumbUrl;
    data['downloadReference'] = this.downloadReference;
    data['size'] = this.size;
    data['previewUrl'] = this.previewUrl;
    return data;
  }
}